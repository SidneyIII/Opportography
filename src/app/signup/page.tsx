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
  const [checkEmail, setCheckEmail] = useState(false)

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
        emailRedirectTo: `${window.location.origin}/auth/callback`,
      },
    })

    if (error) {
      setError(error.message)
      setLoading(false)
      return
    }

    // If no session, email confirmation is required
    if (!data.session) {
      setCheckEmail(true)
      setLoading(false)
      return
    }

    // Session established immediately (email confirmation disabled)
    await fetch('/api/profile', {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ first_name: firstName }),
    })

    router.push('/onboarding')
  }

  async function handleGoogleSignup() {
    await supabase.auth.signInWithOAuth({
      provider: 'google',
      options: {
        redirectTo: `${window.location.origin}/auth/callback`,
      },
    })
  }

  if (checkEmail) {
    return (
      <div className="mx-auto max-w-md px-4 py-16 text-center">
        <div className="rounded-xl border border-navy-600 bg-navy-800 p-8">
          <h1 className="font-display text-2xl font-bold text-slate-50">Check your email</h1>
          <p className="mt-3 text-slate-400">
            We sent a confirmation link to <span className="text-slate-200">{email}</span>.
            Click it to activate your account and get started.
          </p>
          <p className="mt-4 text-xs text-slate-500">
            Don&apos;t see it? Check your spam folder.
          </p>
        </div>
      </div>
    )
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

        <div className="my-6 flex items-center gap-3">
          <div className="h-px flex-1 bg-navy-600" />
          <span className="text-xs text-slate-500">or</span>
          <div className="h-px flex-1 bg-navy-600" />
        </div>

        <button
          onClick={handleGoogleSignup}
          className="flex w-full items-center justify-center gap-3 rounded-lg border border-navy-600 px-4 py-3 text-sm font-medium text-slate-300 transition-colors hover:border-slate-500 hover:text-slate-100"
        >
          <svg width="18" height="18" viewBox="0 0 18 18" fill="none">
            <path d="M17.64 9.2c0-.637-.057-1.251-.164-1.84H9v3.481h4.844a4.14 4.14 0 01-1.796 2.716v2.259h2.908c1.702-1.567 2.684-3.875 2.684-6.615z" fill="#4285F4"/>
            <path d="M9 18c2.43 0 4.467-.806 5.956-2.18l-2.908-2.259c-.806.54-1.837.86-3.048.86-2.344 0-4.328-1.584-5.036-3.711H.957v2.332A8.997 8.997 0 009 18z" fill="#34A853"/>
            <path d="M3.964 10.71A5.41 5.41 0 013.682 9c0-.593.102-1.17.282-1.71V4.958H.957A8.996 8.996 0 000 9c0 1.452.348 2.827.957 4.042l3.007-2.332z" fill="#FBBC05"/>
            <path d="M9 3.58c1.321 0 2.508.454 3.44 1.345l2.582-2.58C13.463.891 11.426 0 9 0A8.997 8.997 0 00.957 4.958L3.964 7.29C4.672 5.163 6.656 3.58 9 3.58z" fill="#EA4335"/>
          </svg>
          Continue with Google
        </button>

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
