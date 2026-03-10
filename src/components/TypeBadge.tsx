import { OpportunityType } from '@/lib/types'
import { getTypeLabel } from '@/lib/utils'

const typeColors: Record<OpportunityType, string> = {
  scholarship: 'bg-emerald-400/15 text-emerald-400 border border-emerald-400/30',
  internship: 'bg-cyan-400/15 text-cyan-400 border border-cyan-400/30',
  summer_program: 'bg-amber-400/15 text-amber-400 border border-amber-400/30',
  mentorship: 'bg-violet-400/15 text-violet-400 border border-violet-400/30',
  competition: 'bg-rose-400/15 text-rose-400 border border-rose-400/30',
  free_resource: 'bg-teal-400/15 text-teal-400 border border-teal-400/30',
  workshop: 'bg-orange-400/15 text-orange-400 border border-orange-400/30',
  college_access: 'bg-indigo-400/15 text-indigo-400 border border-indigo-400/30',
}

export function TypeBadge({ type }: { type: OpportunityType }) {
  return (
    <span
      className={`inline-block rounded-full px-2.5 py-0.5 text-xs font-medium ${typeColors[type]}`}
    >
      {getTypeLabel(type)}
    </span>
  )
}
