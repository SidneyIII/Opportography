import { getAllOpportunities, getMetroAreas, getMetroAreaBySlug } from '@/lib/queries'
import { BrowseClient } from './BrowseClient'

export const dynamic = 'force-dynamic'

export default async function BrowsePage({
  searchParams,
}: {
  searchParams: Promise<{ metro?: string }>
}) {
  const { metro: metroSlug } = await searchParams
  const [metros, selectedMetro] = await Promise.all([
    getMetroAreas(),
    metroSlug ? getMetroAreaBySlug(metroSlug) : Promise.resolve(null),
  ])

  const activeMetro = selectedMetro?.is_active ? selectedMetro : null
  const opportunities = activeMetro ? await getAllOpportunities(activeMetro.id) : []

  return (
    <BrowseClient
      opportunities={opportunities}
      metros={metros}
      selectedMetro={activeMetro}
    />
  )
}
