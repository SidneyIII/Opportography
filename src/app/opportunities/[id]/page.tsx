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

/** Centered pill-style section label — avoids the global h2 font-size override */
function SectionLabel({ children }: { children: React.ReactNode }) {
  return (
    <div className="mb-3 flex justify-center">
      <span className="rounded-md border border-navy-500 bg-navy-900 px-3 py-1 text-xs font-semibold tracking-wide text-slate-400">
        {children}
      </span>
    </div>
  )
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

  const gradLabels = opp.grade_levels.map(formatGradeLevel).filter(Boolean) as string[]

  return (
    <div className="mx-auto max-w-3xl px-4 py-8">
      <BackButton />

      <div className="rounded-xl border border-navy-600 bg-navy-800 p-6 shadow-xl shadow-navy-950/50 md:p-8">

        {/* ── Header ─────────────────────────────────────────────────────── */}
        <div className="flex items-start justify-between gap-4">
          <div className="min-w-0 flex-1">
            <div className="mb-3 flex flex-wrap items-center gap-2">
              <TypeBadge type={opp.type} />
              <span className="text-xs text-slate-500">{opp.location}</span>
            </div>
            <p className="font-display text-2xl font-bold leading-snug text-slate-50">{opp.title}</p>
            <p className="mt-1 text-sm text-slate-400">{opp.organization}</p>
          </div>
          <BookmarkButton id={opp.id} />
        </div>

        <hr className="my-6 border-navy-600" />

        {/* ── Body sections ───────────────────────────────────────────────── */}
        <div className="space-y-8">

          {/* About */}
          <div>
            <SectionLabel>About This Opportunity</SectionLabel>
            <p className="leading-relaxed text-slate-300">{opp.description}</p>
          </div>

          {/* Who Can Apply */}
          {opp.eligibility && (
            <div>
              <SectionLabel>Who Can Apply</SectionLabel>
              <p className="leading-relaxed text-slate-300">{opp.eligibility}</p>
            </div>
          )}

          {/* Deadline + Audience — side by side on sm+ */}
          <div className="grid gap-6 sm:grid-cols-2">
            <div className="rounded-lg border border-navy-600 bg-navy-900/50 p-4 text-center">
              <SectionLabel>Deadline</SectionLabel>
              <p className="font-medium text-slate-100">{formatDeadline(opp.deadline)}</p>
            </div>

            {gradLabels.length > 0 ? (
              <div className="rounded-lg border border-navy-600 bg-navy-900/50 p-4 text-center">
                <SectionLabel>Age Group</SectionLabel>
                <p className="text-slate-300">{gradLabels.join(', ')}</p>
              </div>
            ) : opp.audience_type ? (
              <div className="rounded-lg border border-navy-600 bg-navy-900/50 p-4 text-center">
                <SectionLabel>Audience</SectionLabel>
                <p className="text-slate-300">{getAudienceLabel(opp.audience_type)}</p>
              </div>
            ) : null}
          </div>

          {/* Compensation */}
          {opp.compensation_type && opp.compensation_amount && (
            <div>
              <SectionLabel>Compensation</SectionLabel>
              <p className="text-center text-slate-300">
                {opp.compensation_amount}
                {opp.compensation_frequency ? ` / ${opp.compensation_frequency}` : ''}
              </p>
            </div>
          )}

          {/* Specifically For */}
          {opp.identity_tags.length > 0 && (
            <div>
              <SectionLabel>Specifically For</SectionLabel>
              <div className="flex flex-wrap justify-center gap-2">
                {opp.identity_tags.map((tag) => (
                  <Link key={tag} href={`/for/${getIdentitySlug(tag)}`}>
                    <IdentityBadge tag={tag} />
                  </Link>
                ))}
              </div>
            </div>
          )}

          {/* Categories */}
          {opp.category_tags.length > 0 && (
            <div>
              <SectionLabel>Categories</SectionLabel>
              <div className="flex flex-wrap justify-center gap-2">
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

        {/* ── CTA buttons ─────────────────────────────────────────────────── */}
        <div className="mt-8 flex flex-wrap justify-center gap-3 border-t border-navy-600 pt-6">
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

      {/* ── Similar Opportunities ────────────────────────────────────────── */}
      {related.length > 0 && (
        <section className="mt-10">
          <p className="font-display mb-4 text-lg font-bold text-slate-50">Similar Opportunities</p>
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
