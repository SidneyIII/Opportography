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
      <p className="text-base leading-relaxed text-slate-400 md:text-lg">
        Educational counseling platforms, civic institutions, and support systems were built
        for traditional pathways — and they consistently fail everyone else through blunt
        personality tests, algorithms that guess at interests, and no real map of what
        actually exists in the communities where people live. The opportunities are there:
        union apprenticeships, local scholarships, first-gen programs, workforce grants —
        but finding them takes hours of research across obscure sites and connections most
        people simply don&apos;t have. Opportography replaces that with hyperlocal resource
        aggregation — every verified opportunity in a metro, one database, surfaced by AI
        in minutes — a software layer that institutions, nonprofits, and school districts
        can adopt to actually serve the populations that need it most. Built by founders
        who navigated low-income backgrounds into institutions like the Ivy League: not
        because the system worked, but because we found the map despite it.
      </p>
    </section>
  )
}
