import Link from 'next/link'

interface ProfileCompletenessProps {
  completeness: number
}

export function ProfileCompleteness({ completeness }: ProfileCompletenessProps) {
  if (completeness >= 80) return null

  const color =
    completeness >= 60 ? 'bg-amber-400' : completeness >= 40 ? 'bg-orange-400' : 'bg-rose-400'

  return (
    <div className="rounded-xl border border-navy-600 bg-navy-800 p-5">
      <div className="mb-3 flex items-center justify-between">
        <span className="text-sm font-medium text-slate-300">Profile completeness</span>
        <span className="text-sm font-semibold text-slate-100">{completeness}%</span>
      </div>
      <div className="h-2 overflow-hidden rounded-full bg-navy-700">
        <div
          className={`h-full rounded-full transition-all ${color}`}
          style={{ width: `${completeness}%` }}
        />
      </div>
      <p className="mt-3 text-xs text-slate-500">
        A complete profile gets significantly better AI matches.{' '}
        <Link href="/onboarding" className="text-cyan-400 hover:text-cyan-300">
          Complete your profile →
        </Link>
      </p>
    </div>
  )
}
