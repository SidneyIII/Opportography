import Link from 'next/link'
import { notFound } from 'next/navigation'
import { getOpportunityById, getRelatedOpportunities, getAllOpportunityIds } from '@/lib/queries'
import { formatDeadline, getCategoryLabel, getIdentitySlug, formatGradeLevel, getAudienceLabel } from '@/lib/utils'
import { TypeBadge } from '@/components/TypeBadge'
import { IdentityBadge } from '@/components/IdentityBadge'
import { BookmarkButton } from '@/components/BookmarkButton'
import { BackButton } from '@/components/BackButton'

export async function generateStaticParams() {
  const ids = await getAllOpportunityIds()
  return ids.map((id) => ({ id }))
}

export default async function OpportunityDetailPage({
  params,
}: {
  params: Promise<{ id: string }>
}) {
  const { id } = await params
  const opp = await getOpportunityById(id)

  if (!opp) notFound()

  const related = await getRelatedOpportunities(opp.id, opp.type)

  return (
    <div className="mx-auto max-w-3xl px-4 py-8">
      <BackButton />

      <div className="rounded-xl border border-navy-600 bg-navy-800 p-6 shadow-xl shadow-navy-950/50 md:p-8">
        <div className="flex items-start justify-between gap-4">
          <div>
            <div className="mb-3 flex flex-wrap items-center gap-2">
              <TypeBadge type={opp.type} />
              <span className="text-xs text-slate-500">{opp.location}</span>
            </div>
            <h1 className="font-display text-2xl font-bold text-slate-50">{opp.title}</h1>
            <p className="mt-1 text-slate-400">{opp.organization}</p>
          </div>
          <BookmarkButton id={opp.id} />
        </div>

        <hr className="my-6 border-navy-600" />

        <div className="space-y-6">
          <div>
            <h2 className="mb-2 text-xs font-semibold uppercase tracking-wider text-slate-500">
              About This Opportunity
            </h2>
            <p className="leading-relaxed text-slate-300">{opp.description}</p>
          </div>

          {opp.eligibility && (
            <div>
              <h2 className="mb-2 text-xs font-semibold uppercase tracking-wider text-slate-500">
                Who Can Apply
              </h2>
              <p className="leading-relaxed text-slate-300">{opp.eligibility}</p>
            </div>
          )}

          <div className="grid gap-4 sm:grid-cols-2">
            <div>
              <h2 className="mb-2 text-xs font-semibold uppercase tracking-wider text-slate-500">
                Deadline
              </h2>
              <p className="font-medium text-slate-100">{formatDeadline(opp.deadline)}</p>
            </div>
            {(() => {
              const gradLabels = opp.grade_levels.map(formatGradeLevel).filter(Boolean) as string[]
              if (gradLabels.length > 0) {
                return (
                  <div>
                    <h2 className="mb-2 text-xs font-semibold uppercase tracking-wider text-slate-500">
                      Grade Levels
                    </h2>
                    <p className="text-slate-300">{gradLabels.join(', ')}</p>
                  </div>
                )
              }
              if (opp.audience_type) {
                return (
                  <div>
                    <h2 className="mb-2 text-xs font-semibold uppercase tracking-wider text-slate-500">
                      Audience
                    </h2>
                    <p className="text-slate-300">{getAudienceLabel(opp.audience_type)}</p>
                  </div>
                )
              }
              return null
            })()}
          </div>

          {opp.compensation_type && opp.compensation_amount && (
            <div>
              <h2 className="mb-2 text-xs font-semibold uppercase tracking-wider text-slate-500">
                Compensation
              </h2>
              <p className="text-slate-300">
                {opp.compensation_amount}
                {opp.compensation_frequency ? ` / ${opp.compensation_frequency}` : ''}
              </p>
            </div>
          )}

          {opp.identity_tags.length > 0 && (
            <div>
              <h2 className="mb-2 text-xs font-semibold uppercase tracking-wider text-slate-500">
                Specifically For
              </h2>
              <div className="flex flex-wrap gap-2">
                {opp.identity_tags.map((tag) => (
                  <Link key={tag} href={`/for/${getIdentitySlug(tag)}`}>
                    <IdentityBadge tag={tag} />
                  </Link>
                ))}
              </div>
            </div>
          )}

          {opp.category_tags.length > 0 && (
            <div>
              <h2 className="mb-2 text-xs font-semibold uppercase tracking-wider text-slate-500">
                Categories
              </h2>
              <div className="flex flex-wrap gap-2">
                {opp.category_tags.map((tag) => (
                  <span
                    key={tag}
                    className="rounded-full border border-navy-500 bg-navy-700 px-2.5 py-0.5 text-xs font-medium text-slate-400"
                  >
                    {getCategoryLabel(tag)}
                  </span>
                ))}
              </div>
            </div>
          )}
        </div>

        <div className="mt-8 flex flex-wrap gap-3">
          <a
            href={opp.link}
            target="_blank"
            rel="noopener noreferrer"
            className="inline-block rounded-lg bg-cyan-400 px-6 py-3 text-sm font-semibold text-navy-950 transition-all hover:bg-cyan-300"
          >
            Apply / Learn More &rarr;
          </a>
          {opp.organization_website && opp.organization_website !== opp.link && (
            <a
              href={opp.organization_website}
              target="_blank"
              rel="noopener noreferrer"
              className="inline-block rounded-lg border border-navy-600 px-6 py-3 text-sm font-semibold text-slate-300 transition-colors hover:border-slate-500 hover:text-slate-100"
            >
              {opp.organization} Website
            </a>
          )}
        </div>
      </div>

      {related.length > 0 && (
        <section className="mt-10">
          <h2 className="font-display mb-4 text-lg font-bold text-slate-50">Similar Opportunities</h2>
          <div className="flex flex-col gap-3">
            {related.map((r) => (
              <Link
                key={r.id}
                href={`/opportunities/${r.id}`}
                className="rounded-lg border border-navy-600 bg-navy-800 p-4 transition-all hover:border-cyan-400/40"
              >
                <div className="flex items-center gap-2">
                  <TypeBadge type={r.type} />
                  <span className="text-sm font-medium text-slate-200">{r.title}</span>
                </div>
                <p className="mt-1 text-xs text-slate-500">{r.organization}</p>
              </Link>
            ))}
          </div>
        </section>
      )}
    </div>
  )
}
