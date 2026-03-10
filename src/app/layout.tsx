import type { Metadata } from 'next'
import { Outfit, DM_Sans } from 'next/font/google'
import './globals.css'
import { Header } from '@/components/Header'
import { Footer } from '@/components/Footer'
import { WhiteboardBackground } from '@/components/WhiteboardBackground'
import { SavedProvider } from '@/lib/saved-context'

const outfit = Outfit({
  subsets: ['latin'],
  variable: '--font-outfit',
  display: 'swap',
})

const dmSans = DM_Sans({
  subsets: ['latin'],
  variable: '--font-dm-sans',
  display: 'swap',
})

export const metadata: Metadata = {
  title: 'Opportography — Find Opportunities Near You',
  description:
    'Discover scholarships, internships, programs, and resources for underserved students in the Omaha/Council Bluffs area. No student should miss out because they didn\'t know.',
  openGraph: {
    title: 'Opportography',
    description: 'Map every opportunity for students who need it most.',
    type: 'website',
  },
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en" className={`${outfit.variable} ${dmSans.variable}`}>
      <body>
        <WhiteboardBackground />
        <SavedProvider>
          <div className="relative z-10 flex min-h-screen flex-col">
            <Header />
            <main className="flex-1">{children}</main>
            <Footer />
          </div>
        </SavedProvider>
      </body>
    </html>
  )
}
