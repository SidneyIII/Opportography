import { supabase } from './supabase'
import { Opportunity, IdentityTag, OpportunityType } from './types'

export async function getAllOpportunities(): Promise<Opportunity[]> {
  const { data, error } = await supabase
    .from('opportunities')
    .select('*')
    .eq('is_active', true)
    .order('deadline', { ascending: true, nullsFirst: false })

  if (error) {
    console.error('Error fetching opportunities:', error)
    return []
  }
  return data as Opportunity[]
}

export async function getFeaturedOpportunities(): Promise<Opportunity[]> {
  const { data, error } = await supabase
    .from('opportunities')
    .select('*')
    .eq('is_active', true)
    .eq('is_featured', true)
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
