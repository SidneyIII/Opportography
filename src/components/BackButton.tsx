'use client'

import { useRouter } from 'next/navigation'

export function BackButton() {
  const router = useRouter()
  return (
    <button
      onClick={() => router.back()}
      className="mb-6 inline-flex items-center gap-1 text-sm text-slate-500 transition-colors hover:text-cyan-400"
    >
      &larr; Back to opportunities
    </button>
  )
}
