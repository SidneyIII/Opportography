import { Resend } from 'resend'

let _resend: Resend | null = null
function getResend(): Resend {
  if (!_resend) _resend = new Resend(process.env.RESEND_API_KEY)
  return _resend
}
const FROM = 'Opportography <hello@opportography.com>'
const APP_URL = process.env.NEXT_PUBLIC_APP_URL ?? 'https://opportography.com'

// ─── Weekly Digest ─────────────────────────────────────────────────────────────

interface DigestMatch {
  title: string
  organization: string
  score: number
  reason: string
  url: string
}

interface WeeklyDigestParams {
  to: string
  firstName: string
  matches: DigestMatch[]
}

export async function sendWeeklyDigestEmail({ to, firstName, matches }: WeeklyDigestParams) {
  const matchRows = matches
    .map(
      (m) => `
    <div style="margin-bottom:16px;padding:16px;background:#141C35;border:1px solid #1E2D52;border-radius:10px;">
      <div style="margin-bottom:8px;">
        <span style="display:inline-block;padding:2px 10px;background:rgba(56,189,248,0.12);color:#38bdf8;border:1px solid rgba(56,189,248,0.3);border-radius:9999px;font-size:11px;font-weight:600;">${m.score}% Match</span>
      </div>
      <div style="font-size:15px;font-weight:600;color:#f1f5f9;margin-bottom:2px;">${m.title}</div>
      <div style="font-size:12px;color:#64748b;margin-bottom:8px;">${m.organization}</div>
      <div style="font-size:13px;color:#94a3b8;font-style:italic;margin-bottom:10px;">"${m.reason}"</div>
      <a href="${m.url}" style="display:inline-block;padding:8px 16px;background:#38bdf8;color:#0A0E1A;border-radius:6px;font-size:12px;font-weight:600;text-decoration:none;">View Opportunity →</a>
    </div>`
    )
    .join('')

  const html = `
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#0A0E1A;font-family:'DM Sans',system-ui,sans-serif;">
  <div style="max-width:600px;margin:0 auto;padding:32px 16px;">
    <div style="margin-bottom:24px;text-align:center;">
      <div style="font-size:22px;font-weight:700;color:#f1f5f9;">Opportography</div>
      <div style="font-size:12px;color:#475569;margin-top:4px;">Your weekly opportunity digest</div>
    </div>
    <div style="padding:24px;background:#141C35;border:1px solid #1E2D52;border-radius:12px;">
      <h1 style="margin:0 0 8px;font-size:20px;font-weight:700;color:#f1f5f9;">Hi ${firstName},</h1>
      <p style="margin:0 0 20px;font-size:14px;color:#94a3b8;">We found ${matches.length} new opportunit${matches.length !== 1 ? 'ies' : 'y'} matched to your profile this week.</p>
      ${matchRows}
      <div style="margin-top:24px;text-align:center;">
        <a href="${APP_URL}/dashboard" style="display:inline-block;padding:12px 28px;background:#38bdf8;color:#0A0E1A;border-radius:8px;font-size:14px;font-weight:600;text-decoration:none;">View All Matches →</a>
      </div>
    </div>
    <div style="margin-top:20px;text-align:center;font-size:11px;color:#334155;">
      <p>You're receiving this because you signed up for weekly digests on Opportography.</p>
      <a href="${APP_URL}/onboarding" style="color:#38bdf8;text-decoration:none;">Update notification settings</a>
    </div>
  </div>
</body>
</html>`

  return getResend().emails.send({
    from: FROM,
    to,
    subject: `Your ${matches.length} new opportunit${matches.length !== 1 ? 'ies' : 'y'} this week — Opportography`,
    html,
  })
}

// ─── Deadline Reminder ─────────────────────────────────────────────────────────

interface DeadlineReminderParams {
  to: string
  opportunityTitle: string
  organization: string
  deadline: string
  daysUntil: number
  url: string
}

export async function sendDeadlineReminderEmail({
  to,
  opportunityTitle,
  organization,
  deadline,
  daysUntil,
  url,
}: DeadlineReminderParams) {
  const urgency = daysUntil === 0 ? 'Today is the last day!' : daysUntil === 1 ? '1 day left!' : `${daysUntil} days left`
  const subjectPrefix = daysUntil <= 2 ? 'Final reminder' : 'Upcoming deadline'

  const html = `
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#0A0E1A;font-family:'DM Sans',system-ui,sans-serif;">
  <div style="max-width:600px;margin:0 auto;padding:32px 16px;">
    <div style="margin-bottom:24px;text-align:center;">
      <div style="font-size:22px;font-weight:700;color:#f1f5f9;">Opportography</div>
    </div>
    <div style="padding:24px;background:#141C35;border:1px solid #1E2D52;border-radius:12px;">
      <div style="margin-bottom:16px;padding:12px;background:rgba(251,113,133,0.08);border:1px solid rgba(251,113,133,0.25);border-radius:8px;text-align:center;">
        <span style="font-size:14px;font-weight:600;color:#fb7185;">${urgency}</span>
      </div>
      <h1 style="margin:0 0 6px;font-size:18px;font-weight:700;color:#f1f5f9;">${opportunityTitle}</h1>
      <p style="margin:0 0 4px;font-size:13px;color:#64748b;">${organization}</p>
      <p style="margin:0 0 20px;font-size:13px;color:#94a3b8;">Deadline: <strong style="color:#fb7185;">${new Date(deadline).toLocaleDateString('en-US', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' })}</strong></p>
      <div style="text-align:center;">
        <a href="${url}" style="display:inline-block;padding:12px 28px;background:#38bdf8;color:#0A0E1A;border-radius:8px;font-size:14px;font-weight:600;text-decoration:none;">Apply Now →</a>
      </div>
    </div>
    <div style="margin-top:20px;text-align:center;font-size:11px;color:#334155;">
      <a href="${APP_URL}/onboarding" style="color:#38bdf8;text-decoration:none;">Update notification settings</a>
    </div>
  </div>
</body>
</html>`

  return getResend().emails.send({
    from: FROM,
    to,
    subject: `${subjectPrefix}: ${opportunityTitle}`,
    html,
  })
}

// ─── New Match Alert ───────────────────────────────────────────────────────────

interface NewMatchAlertParams {
  to: string
  firstName: string
  opportunityTitle: string
  organization: string
  score: number
  reason: string
  url: string
}

export async function sendNewMatchAlertEmail({
  to,
  firstName,
  opportunityTitle,
  organization,
  score,
  reason,
  url,
}: NewMatchAlertParams) {
  const html = `
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#0A0E1A;font-family:'DM Sans',system-ui,sans-serif;">
  <div style="max-width:600px;margin:0 auto;padding:32px 16px;">
    <div style="margin-bottom:24px;text-align:center;">
      <div style="font-size:22px;font-weight:700;color:#f1f5f9;">Opportography</div>
    </div>
    <div style="padding:24px;background:#141C35;border:1px solid #1E2D52;border-radius:12px;">
      <p style="margin:0 0 16px;font-size:14px;color:#94a3b8;">Hi ${firstName}, a new opportunity was just added that matches your profile:</p>
      <div style="margin-bottom:16px;padding:16px;background:#0F1629;border:1px solid #1E2D52;border-radius:8px;">
        <div style="margin-bottom:8px;"><span style="display:inline-block;padding:2px 10px;background:rgba(56,189,248,0.12);color:#38bdf8;border:1px solid rgba(56,189,248,0.3);border-radius:9999px;font-size:11px;font-weight:600;">${score}% Match</span></div>
        <div style="font-size:16px;font-weight:700;color:#f1f5f9;margin-bottom:4px;">${opportunityTitle}</div>
        <div style="font-size:12px;color:#64748b;margin-bottom:10px;">${organization}</div>
        <div style="font-size:13px;color:#94a3b8;font-style:italic;">"${reason}"</div>
      </div>
      <div style="text-align:center;">
        <a href="${url}" style="display:inline-block;padding:12px 28px;background:#38bdf8;color:#0A0E1A;border-radius:8px;font-size:14px;font-weight:600;text-decoration:none;">View Opportunity →</a>
      </div>
    </div>
    <div style="margin-top:20px;text-align:center;font-size:11px;color:#334155;">
      <a href="${APP_URL}/onboarding" style="color:#38bdf8;text-decoration:none;">Update notification settings</a>
    </div>
  </div>
</body>
</html>`

  return getResend().emails.send({
    from: FROM,
    to,
    subject: `New ${score}% match: ${opportunityTitle}`,
    html,
  })
}
