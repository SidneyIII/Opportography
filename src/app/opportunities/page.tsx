import { getAllOpportunities } from '@/lib/queries'
import { BrowseClient } from './BrowseClient'

export default async function BrowsePage() {
  const opportunities = await getAllOpportunities()
  return <BrowseClient opportunities={opportunities} />
}
