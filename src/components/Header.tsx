'use client'

import Link from 'next/link'
import { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { createSupabaseBrowserClient } from '@/lib/supabase-browser'
import { NotificationBell } from '@/components/NotificationBell'
import type { User } from '@supabase/supabase-js'

const navLinks = [
  { href: '/', label: 'Home' },
  { href: '/opportunities', label: 'Browse' },
]

export function Header() {
  const [menuOpen, setMenuOpen] = useState(false)
  const [userMenuOpen, setUserMenuOpen] = useState(false)
  const [user, setUser] = useState<User | null>(null)
  const [firstName, setFirstName] = useState<string | null>(null)
  const router = useRouter()
  const supabase = createSupabaseBrowserClient()

  useEffect(() => {
    supabase.auth.getUser().then(({ data: { user } }) => {
      setUser(user ?? null)
      if (user) {
        // Fetch first name from profile
        supabase
          .from('user_profiles')
          .select('first_name')
          .eq('id', user.id)
          .single()
          .then(({ data }) => setFirstName(data?.first_name ?? null))
      }
    })

    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null)
      if (!session?.user) {
        setFirstName(null)
      }
    })

    return () => subscription.unsubscribe()
  }, [supabase])

  async function handleSignOut() {
    await supabase.auth.signOut()
    setUser(null)
    setUserMenuOpen(false)
    router.push('/')
    router.refresh()
  }

  return (
    <header className="sticky top-0 z-50 border-b border-navy-600 glass">
      <div className="relative mx-auto flex max-w-6xl items-center justify-between px-4 py-3">
        <Link
          href="/"
          className="text-slate-50 transition-colors hover:text-cyan-400"
          aria-label="Opportography home"
        >
          <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.75" strokeLinecap="round" strokeLinejoin="round">
            <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7z" />
            <circle cx="12" cy="9" r="2.5" />
          </svg>
        </Link>

        {/* Right side: nav + auth + notifications */}
        <div className="flex items-center gap-2">
          <nav className="mr-2 hidden items-center gap-6 md:flex">
            {navLinks.map((link) => (
              <Link
                key={link.href}
                href={link.href}
                className="text-sm font-medium text-slate-400 transition-colors hover:text-cyan-400"
              >
                {link.label}
              </Link>
            ))}
          </nav>
          {user ? (
            <>
              <NotificationBell />

              {/* User menu */}
              <div className="relative">
                <button
                  onClick={() => setUserMenuOpen((o) => !o)}
                  className="flex items-center gap-2 rounded-lg border border-navy-600 px-3 py-1.5 text-sm text-slate-300 transition-colors hover:border-navy-500 hover:text-slate-100"
                >
                  <span className="flex h-6 w-6 items-center justify-center rounded-full bg-cyan-400/20 text-xs font-bold text-cyan-400">
                    {(firstName ?? user.email ?? 'U')[0].toUpperCase()}
                  </span>
                  <span className="hidden sm:inline">{firstName ?? 'Account'}</span>
                  <svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor">
                    <path d="M6 8L1 3h10L6 8z" />
                  </svg>
                </button>

                {userMenuOpen && (
                  <div className="absolute right-0 top-10 z-50 w-44 rounded-xl border border-navy-600 bg-navy-800 py-1 shadow-xl">
                    <Link
                      href="/dashboard"
                      onClick={() => setUserMenuOpen(false)}
                      className="block px-4 py-2.5 text-sm text-slate-300 transition-colors hover:bg-navy-700 hover:text-slate-100"
                    >
                      Dashboard
                    </Link>
                    <Link
                      href="/onboarding"
                      onClick={() => setUserMenuOpen(false)}
                      className="block px-4 py-2.5 text-sm text-slate-300 transition-colors hover:bg-navy-700 hover:text-slate-100"
                    >
                      Edit Profile
                    </Link>
                    <div className="my-1 border-t border-navy-700" />
                    <button
                      onClick={handleSignOut}
                      className="block w-full px-4 py-2.5 text-left text-sm text-slate-400 transition-colors hover:bg-navy-700 hover:text-rose-400"
                    >
                      Sign Out
                    </button>
                  </div>
                )}
              </div>
            </>
          ) : (
            <div className="hidden items-center gap-3 md:flex">
              <Link
                href="/login"
                className="text-sm font-medium text-slate-400 transition-colors hover:text-slate-100"
              >
                Sign In
              </Link>
              <Link
                href="/signup"
                className="rounded-lg bg-cyan-400 px-4 py-1.5 text-sm font-semibold text-navy-950 transition-all hover:bg-cyan-300"
              >
                Sign Up Free
              </Link>
            </div>
          )}

          {/* Mobile menu button */}
          <button
            onClick={() => setMenuOpen(!menuOpen)}
            className="flex flex-col gap-1.5 p-2 md:hidden"
            aria-label="Toggle menu"
            aria-expanded={menuOpen}
          >
            <span
              className={`h-0.5 w-5 bg-slate-300 transition-transform duration-200 ${menuOpen ? 'translate-y-2 rotate-45' : ''}`}
            />
            <span
              className={`h-0.5 w-5 bg-slate-300 transition-opacity duration-200 ${menuOpen ? 'opacity-0' : ''}`}
            />
            <span
              className={`h-0.5 w-5 bg-slate-300 transition-transform duration-200 ${menuOpen ? '-translate-y-2 -rotate-45' : ''}`}
            />
          </button>
        </div>
      </div>

      {/* Mobile nav */}
      {menuOpen && (
        <nav className="border-t border-navy-600 bg-navy-900 px-4 py-3 md:hidden">
          {navLinks.map((link) => (
            <Link
              key={link.href}
              href={link.href}
              onClick={() => setMenuOpen(false)}
              className="block py-2.5 text-sm font-medium text-slate-300 transition-colors hover:text-cyan-400"
            >
              {link.label}
            </Link>
          ))}
          {user ? (
            <>
              <Link
                href="/dashboard"
                onClick={() => setMenuOpen(false)}
                className="block py-2.5 text-sm font-medium text-slate-300 transition-colors hover:text-cyan-400"
              >
                Dashboard
              </Link>
              <button
                onClick={() => { setMenuOpen(false); handleSignOut() }}
                className="block py-2.5 text-sm font-medium text-slate-400 transition-colors hover:text-rose-400"
              >
                Sign Out
              </button>
            </>
          ) : (
            <>
              <Link
                href="/login"
                onClick={() => setMenuOpen(false)}
                className="block py-2.5 text-sm font-medium text-slate-300 transition-colors hover:text-cyan-400"
              >
                Sign In
              </Link>
              <Link
                href="/signup"
                onClick={() => setMenuOpen(false)}
                className="mt-2 block rounded-lg bg-cyan-400 px-4 py-2.5 text-center text-sm font-semibold text-navy-950"
              >
                Sign Up Free
              </Link>
            </>
          )}
        </nav>
      )}
    </header>
  )
}
