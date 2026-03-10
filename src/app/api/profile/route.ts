import { NextResponse } from 'next/server'
import { createSupabaseServerClient, createSupabaseServiceClient } from '@/lib/supabase-server'

function calculateCompleteness(profile: Record<string, unknown>): number {
  const fields = [
    { key: 'first_name', weight: 15 },
    { key: 'age_range', weight: 10 },
    { key: 'city', weight: 10 },
    { key: 'current_status', weight: 10 },
    { key: 'education_level', weight: 10 },
    { key: 'household_type', weight: 5 },
    { key: 'interest_categories', weight: 20 },
    { key: 'languages', weight: 5 },
    { key: 'community_identities', weight: 5 },
    { key: 'goals_freetext', weight: 10 },
  ]

  let total = 0
  for (const f of fields) {
    const val = profile[f.key]
    if (Array.isArray(val) ? val.length > 0 : Boolean(val)) {
      total += f.weight
    }
  }
  return Math.min(100, total)
}

// Sensitive fields — never returned in GET response
const SENSITIVE_FIELDS = ['community_identities']

export async function GET() {
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return NextResponse.json({ error: 'Authentication required.' }, { status: 401 })

  const service = createSupabaseServiceClient()
  const { data, error } = await service
    .from('user_profiles')
    .select('*')
    .eq('id', user.id)
    .single()

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  // Strip sensitive fields before returning to client
  const safe = { ...data }
  for (const f of SENSITIVE_FIELDS) {
    delete safe[f]
  }

  return NextResponse.json({ profile: safe, email: user.email })
}

export async function PUT(request: Request) {
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return NextResponse.json({ error: 'Authentication required.' }, { status: 401 })

  const body = await request.json()

  // Whitelist allowed fields (prevent clients from updating system fields)
  const allowed = [
    'first_name', 'age_range', 'city', 'state', 'zip_code',
    'current_status', 'education_level', 'household_type',
    'interest_categories', 'languages', 'community_identities',
    'goals_freetext',
    'notification_email', 'notification_sms', 'weekly_digest',
    'deadline_reminders', 'new_match_alerts',
  ]

  const updates: Record<string, unknown> = {}
  for (const key of allowed) {
    if (key in body) updates[key] = body[key]
  }

  // Recalculate profile completeness
  const service = createSupabaseServiceClient()
  const { data: existing } = await service
    .from('user_profiles')
    .select('*')
    .eq('id', user.id)
    .single()

  const merged = { ...(existing ?? {}), ...updates }
  updates.profile_completeness = calculateCompleteness(merged)
  updates.updated_at = new Date().toISOString()

  const { data, error } = await service
    .from('user_profiles')
    .update(updates)
    .eq('id', user.id)
    .select()
    .single()

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  // Strip sensitive fields
  const safe = { ...data }
  for (const f of SENSITIVE_FIELDS) {
    delete safe[f]
  }

  return NextResponse.json({ profile: safe })
}

export async function DELETE() {
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return NextResponse.json({ error: 'Authentication required.' }, { status: 401 })

  // Delete auth user — cascades to user_profiles and all related tables via FK
  const service = createSupabaseServiceClient()
  const { error } = await service.auth.admin.deleteUser(user.id)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  return NextResponse.json({ success: true })
}
