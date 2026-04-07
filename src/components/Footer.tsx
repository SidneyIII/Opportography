import Link from 'next/link'

export function Footer() {
  return (
    <footer className="border-t border-navy-600 bg-navy-950">
      <div className="mx-auto max-w-6xl px-4 py-8">
        <div className="flex flex-col items-start gap-3 md:flex-row md:items-center md:justify-between">

          {/* Left — brand + copyright */}
          <div>
            <p className="font-display text-sm font-semibold text-cyan-400">Opportography</p>
            <p className="mt-0.5 text-xs text-slate-600">&copy; 2026 Opportography. All rights reserved.</p>
          </div>

          {/* Right — legal links */}
          <nav className="flex gap-4 text-xs text-slate-500">
            <Link href="/terms" className="transition-colors hover:text-cyan-400">Terms &amp; Conditions</Link>
            <span className="text-slate-700">&middot;</span>
            <Link href="/privacy" className="transition-colors hover:text-cyan-400">Privacy Policy</Link>
          </nav>
        </div>

        <div className="mt-6 border-t border-navy-800 pt-4 text-center text-xs text-slate-600">
          Currently serving:{' '}
          <span className="text-slate-500">Omaha–Council Bluffs Metro</span>
          {' '}|{' '}
          <span>Akron Metro (Coming Soon)</span>
          {' '}&middot;{' '}
          <Link href="/support" className="transition-colors hover:text-slate-400">
            Bring Opportography to your city
          </Link>
        </div>
      </div>
    </footer>
  )
}
