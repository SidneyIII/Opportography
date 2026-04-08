'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'

const ROLES = [
  {
    id: 'high_school_student',
    label: 'High School Student',
    description: 'I\'m a student looking for scholarships, internships, programs, and pathways for my future.',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" className="h-7 w-7 text-cyan-400">
        <path d="M12 3L2 8l10 5 10-5-10-5z" />
        <path d="M2 13l10 5 10-5" />
        <path d="M2 18l10 5 10-5" />
      </svg>
    ),
  },
  {
    id: 'civic_nonprofit',
    label: 'Civic or Nonprofit Worker',
    description: 'I work at a school, nonprofit, or civic institution and want to connect people to local resources.',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" className="h-7 w-7 text-cyan-400">
        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
        <circle cx="9" cy="7" r="4" />
        <path d="M23 21v-2a4 4 0 0 0-3-3.87" />
        <path d="M16 3.13a4 4 0 0 1 0 7.75" />
      </svg>
    ),
  },
  {
    id: 'general',
    label: 'General Use',
    description: 'I\'m exploring opportunities for myself or someone I know, or I\'m just curious about what\'s available.',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" className="h-7 w-7 text-cyan-400">
        <circle cx="12" cy="12" r="10" />
        <path d="M12 8v4l3 3" />
      </svg>
    ),
  },
]

export default function ChooseRolePage() {
  const [selected, setSelected] = useState<string | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const router = useRouter()

  async function handleContinue() {
    if (!selected) return
    setLoading(true)
    setError(null)

    const res = await fetch('/api/profile', {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ user_type: selected }),
    })

    if (!res.ok) {
      setError('Something went wrong. Please try again.')
      setLoading(false)
      return
    }

    router.push('/onboarding')
  }

  return (
    <main className="flex min-h-[85vh] items-center justify-center px-4 py-16">
      <div className="w-full max-w-xl">
        <div className="mb-10 text-center">
          <h1 className="font-display text-3xl font-bold text-white md:text-4xl">
            How will you use <span className="text-cyan-400">Opportography</span>?
          </h1>
          <p className="mt-3 text-slate-400">
            This helps us tailor your dashboard to what matters most to you.
          </p>
        </div>

        <div className="flex flex-col gap-4">
          {ROLES.map((role) => (
            <button
              key={role.id}
              onClick={() => setSelected(role.id)}
              className="flex items-start gap-5 rounded-xl border p-5 text-left transition-all"
              style={{
                background: selected === role.id ? 'rgba(34,211,238,0.08)' : 'rgba(14,22,50,0.85)',
                borderColor: selected === role.id ? 'rgba(34,211,238,0.5)' : 'rgba(45,64,112,0.6)',
              }}
            >
              <div className="mt-0.5 flex h-12 w-12 shrink-0 items-center justify-center rounded-lg border border-navy-600 bg-navy-900">
                {role.icon}
              </div>
              <div>
                <p className="font-semibold text-white">{role.label}</p>
                <p className="mt-1 text-sm text-slate-400">{role.description}</p>
              </div>
              {selected === role.id && (
                <div className="ml-auto mt-1 shrink-0">
                  <svg viewBox="0 0 20 20" fill="currentColor" className="h-5 w-5 text-cyan-400">
                    <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clipRule="evenodd" />
                  </svg>
                </div>
              )}
            </button>
          ))}
        </div>

        {error && (
          <p className="mt-4 text-sm text-rose-400">{error}</p>
        )}

        <button
          onClick={handleContinue}
          disabled={!selected || loading}
          className="mt-8 w-full rounded-lg bg-cyan-400 py-4 text-base font-semibold text-navy-950 transition-all hover:bg-cyan-300 disabled:opacity-40"
        >
          {loading ? 'Saving...' : 'Continue →'}
        </button>
      </div>
    </main>
  )
}
