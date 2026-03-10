import { NextResponse } from 'next/server'
import { createSupabaseServerClient, createSupabaseServiceClient } from '@/lib/supabase-server'
import { runUserMatch, type UserProfile } from '@/lib/matching-engine'

const ON_DEMAND_LIMIT = 9999 // TODO: set to 10-25 before launch

export async function POST(request: Request) {
  try {
    const supabase = await createSupabaseServerClient()
    const { data: { user } } = await supabase.auth.getUser()

    if (!user) {
      return NextResponse.json({ error: 'Authentication required.' }, { status: 401 })
    }

    // Parse optional search context from request body
    let searchContext: string | undefined
    try {
      const body = await request.json()
      const raw = body?.search_context
      if (typeof raw === 'string') {
        // Strip HTML and limit length
        searchContext = raw.replace(/<[^>]*>/g, '').trim().substring(0, 500) || undefined
      }
    } catch {
      // No body or non-JSON — fine, treat as plain profile search
    }

    const service = createSupabaseServiceClient()

    // Fetch user profile
    const { data: profile } = await service
      .from('user_profiles')
      .select('*')
      .eq('id', user.id)
      .single()

    if (!profile) {
      return NextResponse.json({ error: 'Profile not found.' }, { status: 404 })
    }

    // Check daily on-demand limit (10/day)
    const today = new Date()
    today.setHours(0, 0, 0, 0)

    const { count } = await service
      .from('match_results')
      .select('*', { count: 'exact', head: true })
      .eq('user_id', user.id)
      .eq('match_type', 'on_demand')
      .gte('generated_at', today.toISOString())

    if ((count ?? 0) >= ON_DEMAND_LIMIT) {
      return NextResponse.json(
        {
          error: 'daily_limit_reached',
          message: `You've run ${ON_DEMAND_LIMIT} matches today. Check back tomorrow!`,
        },
        { status: 429 }
      )
    }

    // Run matching pipeline
    const userProfile: UserProfile = {
      id: profile.id,
      first_name: profile.first_name,
      age_range: profile.age_range,
      city: profile.city,
      state: profile.state,
      current_status: profile.current_status,
      education_level: profile.education_level,
      household_type: profile.household_type,
      interest_categories: profile.interest_categories,
      languages: profile.languages,
      community_identities: profile.community_identities,
      goals_freetext: profile.goals_freetext,
    }

    const matches = await runUserMatch(userProfile, searchContext)

    // Store results in match_results table
    if (matches.length > 0) {
      await service.from('match_results').insert(
        matches.map((m) => ({
          user_id: user.id,
          opportunity_id: m.opportunity_id,
          match_score: m.score,
          match_reasoning: m.match_reason,
          match_type: 'on_demand',
        }))
      )

      // Update last_matched_at
      await service
        .from('user_profiles')
        .update({ last_matched_at: new Date().toISOString() })
        .eq('id', user.id)
    }

    return NextResponse.json({ matches })
  } catch (error) {
    console.error('User match error:', error)
    return NextResponse.json(
      { error: 'Something went wrong. Please try again.' },
      { status: 500 }
    )
  }
}
