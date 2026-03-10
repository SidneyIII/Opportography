import { NextResponse } from 'next/server'
import { createSupabaseServiceClient } from '@/lib/supabase-server'
import { runUserMatch, type UserProfile } from '@/lib/matching-engine'
import { sendWeeklyDigestEmail } from '@/lib/email-templates'

export async function POST(request: Request) {
  // Verify cron secret
  const auth = request.headers.get('authorization')
  if (auth !== `Bearer ${process.env.CRON_SECRET}`) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  const service = createSupabaseServiceClient()
  let processed = 0
  let failed = 0

  // Fetch all users with weekly_digest enabled
  const { data: users, error } = await service
    .from('user_profiles')
    .select('*')
    .eq('weekly_digest', true)

  if (error) {
    console.error('Weekly digest: failed to fetch users', error)
    return NextResponse.json({ error: error.message }, { status: 500 })
  }

  for (const profile of users ?? []) {
    try {
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

      const matches = await runUserMatch(userProfile)
      const top5 = matches.slice(0, 5)

      if (top5.length === 0) continue

      // Store match results
      await service.from('match_results').insert(
        top5.map((m) => ({
          user_id: profile.id,
          opportunity_id: m.opportunity_id,
          match_score: m.score,
          match_reasoning: m.match_reason,
          match_type: 'weekly_digest',
        }))
      )

      // Create in-app notification
      await service.from('notifications').insert({
        user_id: profile.id,
        type: 'weekly_digest',
        title: `${top5.length} new opportunities matched for you`,
        body: `Your weekly matches are ready. Check your dashboard to see them.`,
        data: { match_count: top5.length },
        channel: 'in_app',
        status: 'sent',
        sent_at: new Date().toISOString(),
      })

      // Send email if opted in
      if (profile.notification_email) {
        const { data: authUser } = await service.auth.admin.getUserById(profile.id)
        const email = authUser.user?.email
        if (email) {
          await sendWeeklyDigestEmail({
            to: email,
            firstName: profile.first_name ?? 'there',
            matches: top5.map((m) => ({
              title: m.opportunity.title,
              organization: m.opportunity.organization,
              score: m.score,
              reason: m.match_reason,
              url: `${process.env.NEXT_PUBLIC_APP_URL}/opportunities/${m.opportunity_id}`,
            })),
          })
        }
      }

      processed++
    } catch (err) {
      console.error(`Weekly digest: failed for user ${profile.id}`, err)
      failed++
    }
  }

  return NextResponse.json({ processed, failed, total: users?.length ?? 0 })
}
