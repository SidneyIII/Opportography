'use client'

import { useState } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { createSupabaseBrowserClient } from '@/lib/supabase-browser'

export default function SignupPage() {
  const [firstName, setFirstName] = useState('')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const router = useRouter()
  const supabase = createSupabaseBrowserClient()

  async function handleSignup(e: React.FormEvent) {
    e.preventDefault()
    setLoading(true)
    setError(null)

    if (password.length < 8) {
      setError('Password must be at least 8 characters.')
      setLoading(false)
      return
    }

    const { data, error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        data: { first_name: firstName },
      },
    })

    if (error) {
      setError(error.message)
      setLoading(false)
      return
    }

    if (!data.session) {
      setError('Account created but could not sign in automatically. Please try signing in.')
      setLoading(false)
      return
    }

    await fetch('/api/profile', {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ first_name: firstName }),
    })

    router.push('/onboarding')
  }

  return (
    <div className="mx-auto max-w-md px-4 py-16">
      <div className="mb-8 text-center">
        <h1 className="font-display text-3xl font-bold text-slate-50">Create your account</h1>
        <p className="mt-2 text-slate-400">
          Free, always. Find opportunities matched to you.
        </p>
      </div>

      <div className="rounded-xl border border-navy-600 bg-navy-800 p-8">
        <form onSubmit={handleSignup} className="space-y-5">
          <div>
            <label htmlFor="firstName" className="mb-1.5 block text-sm font-medium text-slate-300">
              First name
            </label>
            <input
              id="firstName"
              type="text"
              value={firstName}
              onChange={(e) => setFirstName(e.target.value)}
              required
              autoComplete="given-name"
              className="w-full rounded-lg border border-navy-600 bg-navy-900 px-4 py-3 text-slate-100 placeholder-slate-500 transition-colors focus:border-cyan-400 focus:outline-none"
              placeholder="Your first name"
            />
          </div>

          <div>
            <label htmlFor="email" className="mb-1.5 block text-sm font-medium text-slate-300">
              Email address
            </label>
            <input
              id="email"
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
              autoComplete="email"
              className="w-full rounded-lg border border-navy-600 bg-navy-900 px-4 py-3 text-slate-100 placeholder-slate-500 transition-colors focus:border-cyan-400 focus:outline-none"
              placeholder="you@example.com"
            />
          </div>

          <div>
            <label htmlFor="password" className="mb-1.5 block text-sm font-medium text-slate-300">
              Password
            </label>
            <input
              id="password"
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
              autoComplete="new-password"
              className="w-full rounded-lg border border-navy-600 bg-navy-900 px-4 py-3 text-slate-100 placeholder-slate-500 transition-colors focus:border-cyan-400 focus:outline-none"
              placeholder="Minimum 8 characters"
            />
            <p className="mt-1 text-xs text-slate-500">At least 8 characters.</p>
          </div>

          {error && (
            <p className="rounded-lg border border-rose-400/30 bg-rose-400/10 px-4 py-3 text-sm text-rose-400">
              {error}
            </p>
          )}

          <button
            type="submit"
            disabled={loading}
            className="w-full rounded-lg bg-cyan-400 py-3 text-sm font-semibold text-navy-950 transition-all hover:bg-cyan-300 disabled:opacity-60"
          >
            {loading ? 'Creating account...' : 'Create Free Account'}
          </button>
        </form>

        <p className="mt-6 text-center text-xs text-slate-500">
          By creating an account, you agree to our privacy-first approach. We never sell your
          data or share your information with third parties.
        </p>
      </div>

      <p className="mt-6 text-center text-sm text-slate-500">
        Already have an account?{' '}
        <Link href="/login" className="text-cyan-400 transition-colors hover:text-cyan-300">
          Sign in
        </Link>
      </p>
    </div>
  )
}
