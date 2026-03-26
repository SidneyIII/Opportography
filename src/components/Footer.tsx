// Phase 7 — dark blueprint redesign
import Link from 'next/link'

export function Footer() {
  return (
    <footer className="border-t border-navy-600 bg-navy-950">
      <div className="mx-auto max-w-6xl px-4 py-8">
        <div className="flex flex-col items-center gap-4 md:flex-row md:justify-between">
          <div>
            <p className="font-display text-sm font-semibold text-cyan-400">Opportography</p>
            <p className="mt-1 text-xs text-slate-500">
              No student should miss out because they didn&apos;t know.
            </p>
          </div>
          <nav className="flex gap-4 text-xs text-slate-500">
            <Link href="/opportunities" className="transition-colors hover:text-cyan-400">Browse</Link>
            <Link href="/about" className="transition-colors hover:text-cyan-400">About</Link>
            <Link href="/support" className="transition-colors hover:text-cyan-400">Support</Link>
          </nav>
        </div>
        <div className="mt-6 border-t border-navy-800 pt-4 text-center text-xs text-slate-600">
          Currently serving:{' '}
          <span className="text-slate-500">Omaha–Council Bluffs Metro</span>
          {' '}|{' '}
          <span>Akron Metro (Coming Soon)</span>
          {' '}·{' '}
          <Link href="/support" className="transition-colors hover:text-slate-400">
            Bring Opportography to your city
          </Link>
        </div>
      </div>
    </footer>
  )
}
