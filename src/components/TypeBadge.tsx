import { OpportunityType } from '@/lib/types'
import { getTypeLabel } from '@/lib/utils'

const typeColors: Record<OpportunityType, string> = {
  scholarship: 'bg-emerald-400/15 text-emerald-400 border border-emerald-400/30',
  institutional_scholarship: 'bg-lime-400/15 text-lime-400 border border-lime-400/30',
  internship: 'bg-cyan-400/15 text-cyan-400 border border-cyan-400/30',
  summer_program: 'bg-amber-400/15 text-amber-400 border border-amber-400/30',
  mentorship: 'bg-violet-400/15 text-violet-400 border border-violet-400/30',
  competition: 'bg-rose-400/15 text-rose-400 border border-rose-400/30',
  free_resource: 'bg-teal-400/15 text-teal-400 border border-teal-400/30',
  workshop: 'bg-orange-400/15 text-orange-400 border border-orange-400/30',
  college_access: 'bg-indigo-400/15 text-indigo-400 border border-indigo-400/30',
  job: 'bg-sky-400/15 text-sky-400 border border-sky-400/30',
  networking: 'bg-purple-400/15 text-purple-400 border border-purple-400/30',
  community: 'bg-fuchsia-400/15 text-fuchsia-400 border border-fuchsia-400/30',
  scientific_exploration: 'bg-green-400/15 text-green-400 border border-green-400/30',
  tutoring: 'bg-yellow-400/15 text-yellow-400 border border-yellow-400/30',
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
