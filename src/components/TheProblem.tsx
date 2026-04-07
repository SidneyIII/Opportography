import { StatPanel } from '@/components/StatPanel'

export function TheProblem() {
  return (
    <section className="mx-auto max-w-6xl px-6 pt-4 pb-20 md:px-8 float-only">

      {/* Gladwell quote — full width above both columns */}
      <blockquote className="mb-14 text-center">
        <p className="text-lg italic leading-relaxed text-slate-400 md:text-xl">
          &ldquo;Outliers are those who have been given opportunities — and who had the strength
          and presence of mind to seize them.&rdquo;
        </p>
        <cite className="mt-3 block text-sm not-italic text-slate-600">
          — Malcolm Gladwell, <em>Outliers</em>
        </cite>
      </blockquote>

      {/* Two-column: stats left, text right */}
      <div className="flex flex-col gap-12 md:flex-row md:items-start md:gap-14">

        {/* Left — interactive stats panel */}
        <div className="w-full md:w-[42%] shrink-0">
          <StatPanel />
        </div>

        {/* Right — heading + body */}
        <div className="flex-1">
          <h2 className="font-display mb-6 text-3xl font-bold text-slate-50 md:text-4xl">
            The Problem
          </h2>
          <p className="text-base leading-relaxed text-slate-400 md:text-lg">
            Many growth and counseling platforms in schools, civic institutions, and growing businesses were built for assisting those with traditional pathways, and they have consistently failed everyone else: blunt personality tests, algorithms that guess at interests, and a lack of any real map of what resources exist in communities. The opportunities are there, but finding them requires hours of research across obscure sites or access to specific connections. Opportography replaces that with hyperlocal resource aggregation, with every verified opportunity in a metro area, in one database, surfaced by A.I. in seconds. This software better serves diverse populations and generates superior long-term impact in the age of A.I, and it&apos;s built by founders who navigated low-income backgrounds into institutions like Ivy League schools - all of whom understand that unique and purpose-driven data is critical.
          </p>
        </div>

      </div>
    </section>
  )
}
