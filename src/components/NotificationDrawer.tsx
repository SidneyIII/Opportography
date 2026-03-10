'use client'

import Link from 'next/link'

interface Notification {
  id: string
  type: string
  title: string
  body: string
  data: Record<string, unknown>
  status: string
  read_at: string | null
  created_at: string
}

interface NotificationDrawerProps {
  notifications: Notification[]
  loading: boolean
  onMarkAllRead: () => void
  onClose: () => void
}

function typeLabel(type: string): string {
  switch (type) {
    case 'weekly_digest': return 'Digest'
    case 'new_match': return 'Match'
    case 'deadline_reminder': return 'Deadline'
    default: return 'Notice'
  }
}

function timeAgo(dateStr: string): string {
  const diff = Date.now() - new Date(dateStr).getTime()
  const mins = Math.floor(diff / 60000)
  if (mins < 60) return `${mins}m ago`
  const hrs = Math.floor(mins / 60)
  if (hrs < 24) return `${hrs}h ago`
  return `${Math.floor(hrs / 24)}d ago`
}

export function NotificationDrawer({
  notifications,
  loading,
  onMarkAllRead,
}: NotificationDrawerProps) {
  const hasUnread = notifications.some((n) => !n.read_at)

  return (
    <div className="absolute right-0 top-11 z-50 w-80 rounded-xl border border-navy-600 bg-navy-800 shadow-2xl shadow-navy-950/50">
      {/* Header */}
      <div className="flex items-center justify-between border-b border-navy-600 px-4 py-3">
        <h3 className="font-display text-sm font-semibold text-slate-50">Notifications</h3>
        {hasUnread && (
          <button
            onClick={onMarkAllRead}
            className="text-xs text-cyan-400 transition-colors hover:text-cyan-300"
          >
            Mark all read
          </button>
        )}
      </div>

      {/* Content */}
      <div className="max-h-[400px] overflow-y-auto">
        {loading && !notifications.length ? (
          <div className="px-4 py-8 text-center text-sm text-slate-500">Loading...</div>
        ) : notifications.length === 0 ? (
          <div className="px-4 py-8 text-center">
            <p className="text-sm text-slate-500">No notifications yet.</p>
            <p className="mt-1 text-xs text-slate-600">
              Run a match to get started!
            </p>
          </div>
        ) : (
          notifications.map((n) => {
            const opportunityId = n.data?.opportunity_id as string | undefined
            const content = (
              <div
                className={`border-b border-navy-700 px-4 py-3 transition-colors hover:bg-navy-700 ${
                  !n.read_at ? 'bg-cyan-400/5' : ''
                }`}
              >
                <div className="flex items-start gap-2.5">
                  <span className="mt-0.5 rounded px-1.5 py-0.5 text-[10px] font-medium uppercase tracking-wide bg-navy-700 text-slate-500">
                    {typeLabel(n.type)}
                  </span>
                  <div className="min-w-0 flex-1">
                    <p
                      className={`text-sm leading-snug ${
                        !n.read_at ? 'font-medium text-slate-100' : 'text-slate-300'
                      }`}
                    >
                      {n.title}
                    </p>
                    <p className="mt-0.5 text-xs text-slate-500">{n.body}</p>
                    <p className="mt-1 text-xs text-slate-600">{timeAgo(n.created_at)}</p>
                  </div>
                  {!n.read_at && (
                    <span className="mt-1.5 h-2 w-2 shrink-0 rounded-full bg-cyan-400" />
                  )}
                </div>
              </div>
            )

            return opportunityId ? (
              <Link key={n.id} href={`/opportunities/${opportunityId}`}>
                {content}
              </Link>
            ) : (
              <div key={n.id}>{content}</div>
            )
          })
        )}
      </div>

      {/* Footer */}
      <div className="border-t border-navy-600 px-4 py-3">
        <Link
          href="/dashboard"
          className="text-xs text-slate-500 transition-colors hover:text-slate-300"
        >
          View all on dashboard →
        </Link>
      </div>
    </div>
  )
}
