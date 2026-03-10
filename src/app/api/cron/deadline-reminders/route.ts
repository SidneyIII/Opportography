import { NextResponse } from 'next/server'
import { createSupabaseServiceClient } from '@/lib/supabase-server'
import { sendDeadlineReminderEmail } from '@/lib/email-templates'

export async function POST(request: Request) {
  const auth = request.headers.get('authorization')
  if (auth !== `Bearer ${process.env.CRON_SECRET}`) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  const service = createSupabaseServiceClient()
  const now = new Date()
  let sent = 0

  // Find opportunities with deadlines in 7 days or 2 days
  const in7Days = new Date(now)
  in7Days.setDate(in7Days.getDate() + 7)
  const in2Days = new Date(now)
  in2Days.setDate(in2Days.getDate() + 2)

  const formatDate = (d: Date) => d.toISOString().split('T')[0]

  const { data: opportunities } = await service
    .from('opportunities')
    .select('id, title, organization, deadline')
    .eq('is_active', true)
    .in('deadline', [formatDate(in7Days), formatDate(in2Days)])

  if (!opportunities?.length) {
    return NextResponse.json({ sent: 0, message: 'No deadlines to remind' })
  }

  for (const opp of opportunities) {
    const daysUntil =
      Math.round((new Date(opp.deadline!).getTime() - now.getTime()) / (1000 * 60 * 60 * 24))

    // Find users who have saved this opportunity or matched with it
    const { data: savedUsers } = await service
      .from('saved_opportunities')
      .select('user_id, user_profiles!inner(notification_email, deadline_reminders)')
      .eq('opportunity_id', opp.id)

    const { data: matchedUsers } = await service
      .from('match_results')
      .select('user_id, user_profiles!inner(notification_email, deadline_reminders)')
      .eq('opportunity_id', opp.id)
      .eq('dismissed', false)

    const userIds = new Set([
      ...(savedUsers?.map((r) => r.user_id) ?? []),
      ...(matchedUsers?.map((r) => r.user_id) ?? []),
    ])

    for (const userId of userIds) {
      const profile = savedUsers?.find((r) => r.user_id === userId)?.user_profiles as {
        notification_email: boolean
        deadline_reminders: boolean
      } | undefined

      if (!profile?.deadline_reminders) continue

      // Check for duplicate notification (don't send twice for same opp + days)
      const { count } = await service
        .from('notifications')
        .select('*', { count: 'exact', head: true })
        .eq('user_id', userId)
        .eq('type', 'deadline_reminder')
        .contains('data', { opportunity_id: opp.id, days_until: daysUntil })

      if ((count ?? 0) > 0) continue

      // Create in-app notification
      await service.from('notifications').insert({
        user_id: userId,
        type: 'deadline_reminder',
        title: `${daysUntil === 2 ? '⏰ 2 days left' : '⚠️ 1 week left'}: ${opp.title}`,
        body: `Apply by ${opp.deadline}. Don't miss out!`,
        data: { opportunity_id: opp.id, days_until: daysUntil },
        channel: 'in_app',
        status: 'sent',
        sent_at: new Date().toISOString(),
      })

      // Send email if opted in
      if (profile?.notification_email) {
        const { data: authUser } = await service.auth.admin.getUserById(userId)
        const email = authUser.user?.email
        if (email) {
          await sendDeadlineReminderEmail({
            to: email,
            opportunityTitle: opp.title,
            organization: opp.organization,
            deadline: opp.deadline!,
            daysUntil,
            url: `${process.env.NEXT_PUBLIC_APP_URL}/opportunities/${opp.id}`,
          })
        }
      }

      sent++
    }
  }

  return NextResponse.json({ sent, opportunities: opportunities.length })
}
