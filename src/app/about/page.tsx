import Link from 'next/link'

export default function AboutPage() {
  return (
    <div className="mx-auto max-w-3xl px-4 py-8">
      <h1 className="font-display mb-6 text-2xl font-bold text-slate-50">About Opportography</h1>

      <div className="space-y-8 leading-relaxed text-slate-300">
        {/* Founder Story */}
        <section className="rounded-xl border border-navy-600 bg-navy-800 p-6">
          <h2 className="font-display mb-3 text-lg font-bold text-slate-50">Why This Exists</h2>
          <p>
            I grew up low-income in Omaha. I was a good student, but I didn&apos;t have parents who
            knew which scholarships to apply for, which programs would set me up for success, or
            even that most of these opportunities existed.
          </p>
          <p className="mt-3">
            The information was out there — scattered across school counselor offices, community
            boards, church bulletins, and obscure websites. But if you didn&apos;t have someone who
            &quot;knew the system,&quot; you fell through the cracks.
          </p>
          <p className="mt-3">
            I built Opportography so that no student misses out on an opportunity just because they
            didn&apos;t know it existed.
          </p>
        </section>

        {/* Mission */}
        <section className="rounded-xl border border-navy-600 bg-navy-800 p-6">
          <h2 className="font-display mb-3 text-lg font-bold text-slate-50">Our Mission</h2>
          <p>
            Map every opportunity available to underserved students in their local community —
            scholarships, internships, programs, mentorships, and resources — so no student misses
            out because they didn&apos;t know it existed.
          </p>
        </section>

        {/* How It Works */}
        <section className="rounded-xl border border-navy-600 bg-navy-800 p-6">
          <h2 className="font-display mb-3 text-lg font-bold text-slate-50">How We Source Opportunities</h2>
          <ul className="list-inside list-disc space-y-2 text-slate-400">
            <li>
              We manually research opportunities from local nonprofits, school districts, national
              organizations, and community groups — including ones with no marketing budget, no
              website, and a PDF in a guidance office as their only presence.
            </li>
            <li>
              Every opportunity is verified before it&apos;s listed — we check that the program is
              active, the link works, and the information is accurate.
            </li>
            <li>
              We regularly re-verify listings to remove expired opportunities and update deadlines.
            </li>
            <li>
              We prioritize opportunities that are free, accessible, and specifically designed for
              underserved students.
            </li>
          </ul>
        </section>

        {/* AI */}
        <section className="rounded-xl border border-navy-600 bg-navy-800 p-6">
          <h2 className="font-display mb-3 text-lg font-bold text-slate-50">AI That Works For You</h2>
          <p>
            Finding the right opportunity isn&apos;t just about having a list — it&apos;s about
            knowing which ones actually fit your situation. That&apos;s where our AI comes in.
          </p>
          <p className="mt-3">
            Describe yourself in plain language — your goals, your background, what you&apos;re
            looking for — and our AI reads the full database and surfaces the opportunities most
            relevant to you specifically. It doesn&apos;t just keyword-match. It reasons about
            your situation the way a knowledgeable mentor would: if you&apos;re a single parent
            looking for job training, it might also surface childcare assistance. If you mentioned
            you work days, it prioritizes evening programs.
          </p>
          <p className="mt-3">
            Think of it as a personal guide who has read every listing, sorted the noise, and
            mapped a path from where you are to where you want to go.
          </p>
        </section>

        {/* CTA */}
        <div className="text-center">
          <p className="text-slate-500">Ready to find your next opportunity?</p>
          <div className="mt-3 flex flex-col items-center gap-3 sm:flex-row sm:justify-center">
            <Link
              href="/"
              className="rounded-lg bg-cyan-400 px-6 py-3 text-sm font-semibold text-navy-950 transition-all hover:bg-cyan-300"
            >
              Try the AI Match
            </Link>
            <Link
              href="/opportunities"
              className="rounded-lg border border-navy-600 px-6 py-3 text-sm font-semibold text-slate-300 transition-colors hover:border-slate-500 hover:text-slate-100"
            >
              Browse All Opportunities
            </Link>
          </div>
        </div>
      </div>
    </div>
  )
}
