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
  title: 'Opportography — Local Opportunity Discovery for Every City',
  description:
    'Opportography maps the complete opportunity landscape of your city — jobs, scholarships, career pathways, community resources, and more. Built for the communities that need it most.',
  openGraph: {
    title: 'Opportography',
    description: 'The opportunity infrastructure your community deserves.',
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
