'use client'

import { useEffect, useState } from 'react'
import Link from 'next/link'

export function AuthErrorToast() {
  const [message, setMessage] = useState<string | null>(null)

  useEffect(() => {
    const hash = window.location.hash
    if (!hash.includes('error=')) return

    const params = new URLSearchParams(hash.replace('#', ''))
    const code = params.get('error_code')

    if (code === 'otp_expired') {
      setMessage('That password reset link has expired. Please request a new one.')
    } else if (params.get('error') === 'access_denied') {
      setMessage('That link is no longer valid. Please try again.')
    }

    // Clean the fragment from the URL without reloading
    history.replaceState(null, '', window.location.pathname)
  }, [])

  if (!message) return null

  return (
    <div className="fixed bottom-6 left-1/2 z-50 -translate-x-1/2 w-[90vw] max-w-md rounded-xl border border-rose-400/30 bg-navy-900 px-5 py-4 shadow-xl">
      <p className="text-sm text-white">{message}</p>
      <Link
        href="/login"
        className="mt-2 inline-block text-xs font-semibold text-cyan-400 hover:text-cyan-300"
      >
        Go back to login &rarr;
      </Link>
      <button
        onClick={() => setMessage(null)}
        className="absolute right-3 top-3 text-slate-500 hover:text-slate-300 text-xs"
      >
        ✕
      </button>
    </div>
  )
}
