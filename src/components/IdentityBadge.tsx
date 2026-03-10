import { IdentityTag } from '@/lib/types'
import { getIdentityLabel } from '@/lib/utils'

export function IdentityBadge({ tag }: { tag: IdentityTag }) {
  return (
    <span className="inline-block rounded-full border border-violet-400/30 bg-violet-400/15 px-2 py-0.5 text-xs font-medium text-violet-400">
      {getIdentityLabel(tag)}
    </span>
  )
}
