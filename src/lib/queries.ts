import { supabase } from './supabase'
import { Opportunity, IdentityTag, OpportunityType, MetroArea } from './types'

export async function getMetroAreas(): Promise<MetroArea[]> {
  const { data, error } = await supabase
    .from('metro_areas')
    .select('*')
    .order('is_flagship', { ascending: false })

  if (error) {
    console.error('Error fetching metro areas:', error)
    return []
  }
  return data as MetroArea[]
}

// Omaha–Council Bluffs is metro_area_id=1 (the only active metro at launch).
// Pass metroId explicitly when multi-metro support is needed; defaults to 1.
export async function getAllOpportunities(metroId = 1): Promise<Opportunity[]> {
  const { data, error } = await supabase
    .from('opportunities')
    .select('*')
    .eq('is_active', true)
    .eq('metro_area_id', metroId)
    .order('deadline', { ascending: true, nullsFirst: false })

  if (error) {
    console.error('Error fetching opportunities:', error)
    return []
  }
  return data as Opportunity[]
}

export async function getFeaturedOpportunities(metroId = 1): Promise<Opportunity[]> {
  const { data, error } = await supabase
    .from('opportunities')
    .select('*')
    .eq('is_active', true)
    .eq('is_featured', true)
    .eq('metro_area_id', metroId)
    .order('deadline', { ascending: true, nullsFirst: false })
    .limit(4)

  if (error) {
    console.error('Error fetching featured opportunities:', error)
    return []
  }
  return data as Opportunity[]
}

export async function getOpportunityById(id: string): Promise<Opportunity | null> {
  const { data, error } = await supabase
    .from('opportunities')
    .select('*')
    .eq('id', id)
    .eq('is_active', true)
    .single()

  if (error) {
    console.error('Error fetching opportunity:', error)
    return null
  }
  return data as Opportunity
}

export async function getOpportunitiesByIdentity(tag: IdentityTag): Promise<Opportunity[]> {
  const { data, error } = await supabase
    .from('opportunities')
    .select('*')
    .eq('is_active', true)
    .contains('identity_tags', [tag])
    .order('deadline', { ascending: true, nullsFirst: false })

  if (error) {
    console.error('Error fetching opportunities by identity:', error)
    return []
  }
  return data as Opportunity[]
}

export async function getOpportunitiesByType(type: OpportunityType): Promise<Opportunity[]> {
  const { data, error } = await supabase
    .from('opportunities')
    .select('*')
    .eq('is_active', true)
    .eq('type', type)
    .order('deadline', { ascending: true, nullsFirst: false })

  if (error) {
    console.error('Error fetching opportunities by type:', error)
    return []
  }
  return data as Opportunity[]
}

export async function getRelatedOpportunities(
  id: string,
  type: OpportunityType
): Promise<Opportunity[]> {
  const { data, error } = await supabase
    .from('opportunities')
    .select('*')
    .eq('is_active', true)
    .eq('type', type)
    .neq('id', id)
    .limit(3)

  if (error) {
    console.error('Error fetching related opportunities:', error)
    return []
  }
  return data as Opportunity[]
}

export async function getAllOpportunityIds(): Promise<string[]> {
  const { data, error } = await supabase
    .from('opportunities')
    .select('id')
    .eq('is_active', true)

  if (error) {
    console.error('Error fetching opportunity IDs:', error)
    return []
  }
  return (data as { id: string }[]).map((d) => d.id)
}
