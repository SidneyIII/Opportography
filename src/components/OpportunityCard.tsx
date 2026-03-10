import Link from 'next/link'
import { Opportunity } from '@/lib/types'
import { formatDeadline, isDeadlineSoon } from '@/lib/utils'
import { TypeBadge } from './TypeBadge'
import { BookmarkButton } from './BookmarkButton'

export function OpportunityCard({ opportunity }: { opportunity: Opportunity }) {
  const { id, title, organization, description, type, deadline, location } = opportunity

  return (
    <Link
      href={`/opportunities/${id}`}
      className="group block rounded-xl border border-navy-600 bg-navy-800 p-5 transition-all hover:border-cyan-400/50 hover:shadow-lg hover:shadow-cyan-400/5"
    >
      <div className="flex items-start justify-between gap-3">
        <div className="min-w-0 flex-1">
          <div className="mb-2 flex flex-wrap items-center gap-2">
            <TypeBadge type={type} />
            <span className="text-xs text-slate-500">{location}</span>
          </div>
          <h3 className="font-display text-base font-semibold text-slate-100 transition-colors group-hover:text-cyan-400">
            {title}
          </h3>
          <p className="mt-0.5 text-sm text-slate-400">{organization}</p>
          <p className="mt-2 line-clamp-2 text-sm text-slate-500">{description}</p>
          <p
            className={`mt-3 text-xs font-medium ${
              isDeadlineSoon(deadline) ? 'text-rose-400' : 'text-slate-500'
            }`}
          >
            {formatDeadline(deadline)}
          </p>
        </div>
        <BookmarkButton id={id} />
      </div>
    </Link>
  )
}
