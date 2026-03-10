import { NextResponse } from 'next/server'
import { createSupabaseServerClient, createSupabaseServiceClient } from '@/lib/supabase-server'

export async function GET() {
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return NextResponse.json({ error: 'Authentication required.' }, { status: 401 })

  const service = createSupabaseServiceClient()
  const { data, error } = await service
    .from('saved_opportunities')
    .select(`
      id,
      saved_at,
      notes,
      opportunity_id,
      match_score,
      match_reasoning,
      starred,
      opportunities (
        id, title, organization, type, deadline, link, location,
        identity_tags, category_tags, is_active
      )
    `)
    .eq('user_id', user.id)
    .order('saved_at', { ascending: false })

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  return NextResponse.json({ saved: data })
}

export async function POST(request: Request) {
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return NextResponse.json({ error: 'Authentication required.' }, { status: 401 })

  const body = await request.json()
  const { opportunity_id, notes, match_score, match_reasoning } = body

  if (!opportunity_id) {
    return NextResponse.json({ error: 'opportunity_id is required.' }, { status: 400 })
  }

  const service = createSupabaseServiceClient()

  // Insert or ignore if already saved (don't overwrite existing match data)
  const { error: upsertError } = await service
    .from('saved_opportunities')
    .upsert(
      { user_id: user.id, opportunity_id, notes: notes ?? null },
      { onConflict: 'user_id,opportunity_id', ignoreDuplicates: true }
    )

  if (upsertError) return NextResponse.json({ error: upsertError.message }, { status: 500 })

  // If match data provided, update it only if not already set (preserve richer data)
  if (match_score != null) {
    await service
      .from('saved_opportunities')
      .update({ match_score, match_reasoning: match_reasoning ?? null })
      .eq('user_id', user.id)
      .eq('opportunity_id', opportunity_id)
      .is('match_score', null)
  }

  const { data, error } = await service
    .from('saved_opportunities')
    .select('*')
    .eq('user_id', user.id)
    .eq('opportunity_id', opportunity_id)
    .single()

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  return NextResponse.json({ saved: data })
}

export async function PATCH(request: Request) {
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return NextResponse.json({ error: 'Authentication required.' }, { status: 401 })

  const { searchParams } = new URL(request.url)
  const opportunity_id = searchParams.get('opportunity_id')

  if (!opportunity_id) {
    return NextResponse.json({ error: 'opportunity_id is required.' }, { status: 400 })
  }

  const body = await request.json()
  const { starred } = body

  if (typeof starred !== 'boolean') {
    return NextResponse.json({ error: 'starred must be a boolean.' }, { status: 400 })
  }

  const service = createSupabaseServiceClient()
  const { error } = await service
    .from('saved_opportunities')
    .update({ starred })
    .eq('user_id', user.id)
    .eq('opportunity_id', opportunity_id)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  return NextResponse.json({ success: true })
}

export async function DELETE(request: Request) {
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return NextResponse.json({ error: 'Authentication required.' }, { status: 401 })

  const { searchParams } = new URL(request.url)
  const opportunity_id = searchParams.get('opportunity_id')

  if (!opportunity_id) {
    return NextResponse.json({ error: 'opportunity_id is required.' }, { status: 400 })
  }

  const service = createSupabaseServiceClient()
  const { error } = await service
    .from('saved_opportunities')
    .delete()
    .eq('user_id', user.id)
    .eq('opportunity_id', opportunity_id)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  return NextResponse.json({ success: true })
}
