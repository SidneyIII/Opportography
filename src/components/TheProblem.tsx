export function TheProblem() {
  return (
    <section className="mx-auto max-w-3xl px-6 py-20 md:px-4">

      {/* Gladwell quote */}
      <blockquote className="mb-14 border-l-2 border-cyan-400 pl-5">
        <p className="text-lg italic leading-relaxed text-slate-400 md:text-xl">
          &ldquo;Outliers are those who have been given opportunities — and who had the strength
          and presence of mind to seize them.&rdquo;
        </p>
        <cite className="mt-3 block text-sm not-italic text-slate-600">
          — Malcolm Gladwell, <em>Outliers</em>
        </cite>
      </blockquote>

      {/* Heading */}
      <h2 className="font-display mb-6 text-3xl font-bold text-slate-50 md:text-4xl">
        The Problem
      </h2>

      {/* Body */}
      <div className="space-y-5 text-base leading-relaxed text-slate-400 md:text-lg">
        <p>
          Educational counseling platforms, civic institutions, nonprofits, and support systems
          were largely built around a single assumption: that the people using them are pursuing
          traditional pathways. Those who aren&apos;t — whether by circumstance or by choice — are
          routinely left out. The resources exist. The connections exist. The funding exists.
          But for too many people, none of it is visible, navigable, or relevant.
        </p>

        <p>
          Existing models have compounded this. Personality-test-driven platforms guess at
          interests using blunt algorithms. College counseling software optimizes for the
          students most likely to succeed on metrics that already exclude the underserved.
          Nobody maps the hyperlocal landscape — the union apprenticeships, the civic grants,
          the community scholarships, the first-gen programs — and nobody integrates the tools
          that would let people sift through that landscape in minutes rather than months of
          research across obscure sites, buried PDFs, and connections most people simply don&apos;t
          have.
        </p>

        <p>
          Opportography is built on a different premise. Hyperlocal resource aggregation —
          every opportunity in a given metro, in one database, verified and maintained — paired
          with AI services that make discovery fast, personal, and actionable. Not a quiz.
          Not an algorithm predicting your future. A map. One that institutions can use, one
          that individuals can use, and one that actually reflects what&apos;s available in the
          real places where people live.
        </p>

        <p>
          This is a sustainable, forward-looking model: a software layer that civic
          institutions, nonprofits, school districts, workforce development organizations, and
          social entrepreneurs can adopt to serve their populations more effectively — with
          data that compounds in value the deeper it goes into each city.
        </p>

        <p className="text-slate-300">
          We built this because we lived it. Founded by people who navigated low-income
          backgrounds into places like Ivy League institutions — not because the system worked
          for us, but because we found the map despite it. We&apos;re building the map we
          wish had existed.
        </p>
      </div>
    </section>
  )
}
