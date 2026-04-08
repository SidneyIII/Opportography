'use client'

import { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { createSupabaseBrowserClient } from '@/lib/supabase-browser'

export default function ResetPasswordPage() {
  const [ready, setReady] = useState(false)
  const [password, setPassword] = useState('')
  const [confirm, setConfirm] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [loading, setLoading] = useState(false)
  const [done, setDone] = useState(false)
  const router = useRouter()
  const supabase = createSupabaseBrowserClient()

  // Supabase automatically parses #access_token from the URL fragment on init.
  // Listen for the PASSWORD_RECOVERY event to confirm the session is active.
  useEffect(() => {
    const { data: { subscription } } = supabase.auth.onAuthStateChange((event) => {
      if (event === 'PASSWORD_RECOVERY' || event === 'SIGNED_IN') {
        setReady(true)
      }
    })
    // Also check if already signed in (e.g. page refresh)
    supabase.auth.getSession().then(({ data: { session } }) => {
      if (session) setReady(true)
    })
    return () => subscription.unsubscribe()
  }, [supabase])

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    setError(null)

    if (password.length < 8) {
      setError('Password must be at least 8 characters.')
      return
    }
    if (password !== confirm) {
      setError('Passwords do not match.')
      return
    }

    setLoading(true)
    const { error } = await supabase.auth.updateUser({ password })
    setLoading(false)

    if (error) {
      setError(error.message)
      return
    }

    setDone(true)
    setTimeout(() => router.push('/dashboard'), 2500)
  }

  return (
    <main className="flex min-h-[80vh] items-center justify-center px-4 py-16">
      <div
        className="w-full max-w-md rounded-2xl border p-8"
        style={{ background: 'rgba(14,22,50,0.90)', borderColor: 'rgba(34,211,238,0.20)' }}
      >
        <h1 className="font-display mb-2 text-2xl font-bold text-white">
          Set a new password
        </h1>
        <p className="mb-8 text-sm text-slate-400">
          Choose a strong password for your Opportography account.
        </p>

        {done ? (
          <div className="rounded-lg border border-cyan-400/30 bg-cyan-400/10 px-4 py-4 text-sm text-cyan-400">
            Password updated. Redirecting you to your dashboard...
          </div>
        ) : !ready ? (
          <p className="text-sm text-slate-500">Verifying your reset link...</p>
        ) : (
          <form onSubmit={handleSubmit} className="flex flex-col gap-5">
            <div>
              <label className="mb-1.5 block text-xs font-medium uppercase tracking-wider text-slate-400">
                New Password
              </label>
              <input
                type="password"
                value={password}
                onChange={e => setPassword(e.target.value)}
                required
                minLength={8}
                placeholder="At least 8 characters"
                className="w-full rounded-lg border border-navy-600 bg-navy-900 px-4 py-3 text-sm text-white placeholder-slate-600 outline-none focus:border-cyan-400/60 focus:ring-1 focus:ring-cyan-400/30"
              />
            </div>

            <div>
              <label className="mb-1.5 block text-xs font-medium uppercase tracking-wider text-slate-400">
                Confirm Password
              </label>
              <input
                type="password"
                value={confirm}
                onChange={e => setConfirm(e.target.value)}
                required
                placeholder="Repeat your new password"
                className="w-full rounded-lg border border-navy-600 bg-navy-900 px-4 py-3 text-sm text-white placeholder-slate-600 outline-none focus:border-cyan-400/60 focus:ring-1 focus:ring-cyan-400/30"
              />
            </div>

            {error && (
              <p className="text-sm text-rose-400">{error}</p>
            )}

            <button
              type="submit"
              disabled={loading}
              className="rounded-lg bg-cyan-400 py-3 text-sm font-semibold text-navy-950 transition-all hover:bg-cyan-300 disabled:opacity-50"
            >
              {loading ? 'Saving...' : 'Save New Password'}
            </button>
          </form>
        )}
      </div>
    </main>
  )
}
