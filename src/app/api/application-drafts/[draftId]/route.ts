import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'
import { createSupabaseServerClient, createSupabaseServiceClient } from '@/lib/supabase-server'

const anthropic = new Anthropic({ apiKey: process.env.ANTHROPIC_API_KEY })

// GET /api/application-drafts/[draftId] — fetch draft with all prompts
export async function GET(
  _request: Request,
  { params }: { params: Promise<{ draftId: string }> }
) {
  const { draftId } = await params
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Authentication required.' }, { status: 401 })

  const service = createSupabaseServiceClient()
  const { data, error } = await service
    .from('application_drafts')
    .select(`
      id, document_name, name, priority, deadline, scratchpad, created_at, opportunity_id,
      opportunities (id, title, organization, description),
      application_prompts (id, position, prompt_text, field_type, word_limit, answer)
    `)
    .eq('id', draftId)
    .eq('user_id', user.id)
    .single()

  if (error) return NextResponse.json({ error: 'Draft not found.' }, { status: 404 })
  return NextResponse.json({ draft: data })
}

// PATCH /api/application-drafts/[draftId]
// — save prompt answer:   { prompt_id, answer }
// — save draft meta:      { name?, priority?, deadline?, scratchpad? }
export async function PATCH(
  request: Request,
  { params }: { params: Promise<{ draftId: string }> }
) {
  const { draftId } = await params
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Authentication required.' }, { status: 401 })

  const body = await request.json()
  const service = createSupabaseServiceClient()

  // Verify ownership
  const { data: draft } = await service
    .from('application_drafts')
    .select('id')
    .eq('id', draftId)
    .eq('user_id', user.id)
    .single()

  if (!draft) return NextResponse.json({ error: 'Draft not found.' }, { status: 404 })

  // Prompt answer update
  if (body.prompt_id !== undefined) {
    const { prompt_id, answer } = body
    if (!prompt_id || typeof answer !== 'string') {
      return NextResponse.json({ error: 'prompt_id and answer are required.' }, { status: 400 })
    }

    const { error } = await service
      .from('application_prompts')
      .update({ answer, updated_at: new Date().toISOString() })
      .eq('id', prompt_id)
      .eq('draft_id', draftId)

    if (error) return NextResponse.json({ error: error.message }, { status: 500 })
    return NextResponse.json({ success: true })
  }

  // Draft meta update
  const allowed = ['name', 'priority', 'deadline', 'scratchpad'] as const
  const updates: Record<string, unknown> = {}
  for (const key of allowed) {
    if (key in body) updates[key] = body[key]
  }

  if (Object.keys(updates).length === 0) {
    return NextResponse.json({ error: 'No valid fields to update.' }, { status: 400 })
  }

  const PRIORITY_VALUES = ['high', 'medium', 'low', 'none']
  if (updates.priority !== undefined && !PRIORITY_VALUES.includes(updates.priority as string)) {
    return NextResponse.json({ error: 'Invalid priority value.' }, { status: 400 })
  }

  const { error } = await service
    .from('application_drafts')
    .update(updates)
    .eq('id', draftId)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })
  return NextResponse.json({ success: true })
}

// POST /api/application-drafts/[draftId] — AI assist (brainstorm or draft)
export async function POST(
  request: Request,
  { params }: { params: Promise<{ draftId: string }> }
) {
  const { draftId } = await params
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Authentication required.' }, { status: 401 })

  const body = await request.json()
  const { prompt_id, mode } = body // mode: 'brainstorm' | 'draft'

  if (!prompt_id || !['brainstorm', 'draft'].includes(mode)) {
    return NextResponse.json({ error: 'prompt_id and mode (brainstorm|draft) required.' }, { status: 400 })
  }

  const service = createSupabaseServiceClient()

  const [{ data: draft }, { data: profile }] = await Promise.all([
    service
      .from('application_drafts')
      .select(`
        id, opportunity_id,
        opportunities (title, organization, description),
        application_prompts (id, prompt_text, field_type, word_limit)
      `)
      .eq('id', draftId)
      .eq('user_id', user.id)
      .single(),
    service
      .from('user_profiles')
      .select('first_name, age_range, city, current_status, education_level, interest_categories, goals_freetext, community_identities')
      .eq('id', user.id)
      .single(),
  ])

  if (!draft) return NextResponse.json({ error: 'Draft not found.' }, { status: 404 })

  const prompts = draft.application_prompts as Array<{ id: string; prompt_text: string; field_type: string; word_limit: number | null }>
  const targetPrompt = prompts.find((p) => p.id === prompt_id)
  if (!targetPrompt) return NextResponse.json({ error: 'Prompt not found.' }, { status: 404 })

  const opp = draft.opportunities as unknown as { title: string; organization: string; description: string } | null

  const profileSummary = profile ? [
    profile.first_name ? `Name: ${profile.first_name}` : null,
    profile.age_range ? `Age range: ${profile.age_range}` : null,
    profile.city ? `City: ${profile.city}` : null,
    profile.current_status?.length ? `Current situation: ${profile.current_status.join(', ')}` : null,
    profile.education_level ? `Education: ${profile.education_level}` : null,
    profile.interest_categories?.length ? `Interests: ${profile.interest_categories.join(', ')}` : null,
    profile.goals_freetext ? `Goals: ${profile.goals_freetext}` : null,
  ].filter(Boolean).join('\n') : ''

  const wordLimit = targetPrompt.word_limit ? `Word limit: ${targetPrompt.word_limit} words.` : ''

  let instruction: string
  if (mode === 'brainstorm') {
    instruction = `Give exactly 3 short bullet-point angles the student could take when answering this prompt. Each bullet should be a specific idea or angle (1-2 sentences), not generic advice. Make them concrete and personal based on the student profile. Output only the 3 bullets, nothing else.`
  } else {
    instruction = `Write a complete, authentic draft response to this prompt in the student's voice. Base it on their profile. ${wordLimit} Sound like a real student — not formal or corporate. End with: "[AI-assisted draft — make it yours before submitting]"`
  }

  const message = `You are helping a student apply for an opportunity.

Opportunity: ${opp?.title ?? 'Unknown'} at ${opp?.organization ?? 'Unknown'}
${opp?.description ? `About: ${opp.description.slice(0, 300)}` : ''}

Student profile:
${profileSummary}

Application prompt:
"${targetPrompt.prompt_text}"
${wordLimit}

${instruction}`

  let result: string
  try {
    const response = await anthropic.messages.create({
      model: 'claude-sonnet-4-6',
      max_tokens: mode === 'brainstorm' ? 300 : 600,
      messages: [{ role: 'user', content: message }],
    })
    result = response.content[0]?.type === 'text' ? response.content[0].text : ''
  } catch {
    return NextResponse.json({ error: 'AI assist failed. Please try again.' }, { status: 500 })
  }

  return NextResponse.json({ result })
}

// DELETE /api/application-drafts/[draftId] — delete draft
export async function DELETE(
  _request: Request,
  { params }: { params: Promise<{ draftId: string }> }
) {
  const { draftId } = await params
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Authentication required.' }, { status: 401 })

  const service = createSupabaseServiceClient()
  const { error } = await service
    .from('application_drafts')
    .delete()
    .eq('id', draftId)
    .eq('user_id', user.id)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })
  return NextResponse.json({ success: true })
}
