import { notFound } from 'next/navigation'
import Link from 'next/link'
import { getOpportunitiesByIdentity } from '@/lib/queries'
import {
  getIdentityFromSlug,
  getIdentityLabel,
  getIdentitySlug,
  allIdentityTags,
} from '@/lib/utils'
import { OpportunityCard } from '@/components/OpportunityCard'

export function generateStaticParams() {
  return allIdentityTags.map((tag) => ({ identity: getIdentitySlug(tag) }))
}

export default async function IdentityPage({
  params,
}: {
  params: Promise<{ identity: string }>
}) {
  const { identity: slug } = await params
  const tag = getIdentityFromSlug(slug)

  if (!tag) notFound()

  const label = getIdentityLabel(tag)
  const opportunities = await getOpportunitiesByIdentity(tag)

  return (
    <div className="mx-auto max-w-6xl px-4 py-8">
      <Link
        href="/"
        className="mb-6 inline-flex items-center gap-1 text-sm text-slate-500 transition-colors hover:text-cyan-400"
      >
        &larr; Back to home
      </Link>

      <div className="mb-8">
        <h1 className="font-display text-2xl font-bold text-slate-50">Opportunities for {label}</h1>
        <p className="mt-1 text-sm text-slate-500">
          {opportunities.length} opportunit{opportunities.length !== 1 ? 'ies' : 'y'} specifically
          for {label.toLowerCase()}.
        </p>
      </div>

      {opportunities.length > 0 ? (
        <div className="grid gap-4 sm:grid-cols-2">
          {opportunities.map((opp) => (
            <OpportunityCard key={opp.id} opportunity={opp} />
          ))}
        </div>
      ) : (
        <div className="rounded-xl border border-navy-600 bg-navy-800 px-6 py-16 text-center">
          <p className="font-display text-lg font-medium text-slate-200">No opportunities yet</p>
          <p className="mt-1 text-sm text-slate-500">
            We&apos;re actively adding more. Check back soon!
          </p>
        </div>
      )}

      <section className="mt-12">
        <h2 className="font-display mb-4 text-lg font-bold text-slate-50">Browse Other Groups</h2>
        <div className="flex flex-wrap gap-2">
          {allIdentityTags
            .filter((t) => t !== tag)
            .map((t) => (
              <Link
                key={t}
                href={`/for/${getIdentitySlug(t)}`}
                className="rounded-full border border-navy-600 px-3 py-1.5 text-xs font-medium text-slate-400 transition-all hover:border-cyan-400/50 hover:bg-navy-800 hover:text-cyan-400"
              >
                {getIdentityLabel(t)}
              </Link>
            ))}
        </div>
      </section>
    </div>
  )
}
