import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'
import { createSupabaseServerClient, createSupabaseServiceClient } from '@/lib/supabase-server'

const anthropic = new Anthropic({ apiKey: process.env.ANTHROPIC_API_KEY })

const ALLOWED_MIME_TYPES = [
  'application/pdf',
  'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
]
const MAX_FILE_SIZE = 5 * 1024 * 1024 // 5MB

function sanitizeFilename(name: string): boolean {
  return !(/[/\\:*?"<>|]/.test(name) || name.includes('..'))
}

async function extractText(buffer: Buffer, mimeType: string): Promise<string> {
  if (mimeType === 'application/pdf') {
    // eslint-disable-next-line @typescript-eslint/no-require-imports
    const pdfParse = require('pdf-parse')
    const result = await pdfParse(buffer)
    return result.text
  } else {
    const mammoth = await import('mammoth')
    const result = await mammoth.extractRawText({ buffer })
    return result.value
  }
}

interface ExtractedPrompt {
  prompt_text: string
  field_type: 'short_answer' | 'essay' | 'checkbox' | 'other'
  word_limit: number | null
}

async function extractPrompts(text: string): Promise<ExtractedPrompt[]> {
  const response = await anthropic.messages.create({
    model: 'claude-haiku-4-5-20251001',
    max_tokens: 1500,
    messages: [{
      role: 'user',
      content: `This is text extracted from an application document. Extract all questions, prompts, and fill-in sections as a JSON array.

Each item must have:
- "prompt_text": the full question or prompt text
- "field_type": one of "short_answer" (1-2 sentences), "essay" (paragraph+), "checkbox" (yes/no or select), "other"
- "word_limit": number if stated in the document, otherwise null

Return ONLY valid JSON array, no explanation, no markdown fences.

Document text:
${text.slice(0, 8000)}`,
    }],
  })

  const raw = response.content[0]?.type === 'text' ? response.content[0].text.trim() : '[]'
  const cleaned = raw.replace(/^```(?:json)?\n?/, '').replace(/\n?```$/, '').trim()

  try {
    const parsed = JSON.parse(cleaned)
    if (!Array.isArray(parsed)) return []
    return parsed
      .filter((p): p is ExtractedPrompt =>
        typeof p.prompt_text === 'string' &&
        ['short_answer', 'essay', 'checkbox', 'other'].includes(p.field_type)
      )
      .slice(0, 20)
  } catch {
    return []
  }
}

// POST /api/application-drafts — upload document or paste text, extract prompts, create draft
export async function POST(request: Request) {
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Authentication required.' }, { status: 401 })

  const contentType = request.headers.get('content-type') ?? ''
  const service = createSupabaseServiceClient()

  // ── Paste-text mode ────────────────────────────────────────────────────────
  if (contentType.includes('application/json')) {
    let body: { text?: string; name?: string; opportunity_id?: string }
    try {
      body = await request.json()
    } catch {
      return NextResponse.json({ error: 'Invalid request.' }, { status: 400 })
    }

    const pastedText = body.text?.trim()
    if (!pastedText) return NextResponse.json({ error: 'No text provided.' }, { status: 400 })
    if (pastedText.length > 40000) {
      return NextResponse.json({ error: 'Pasted text is too long (max ~40,000 characters).' }, { status: 400 })
    }

    let prompts: ExtractedPrompt[]
    try {
      prompts = await extractPrompts(pastedText)
    } catch {
      prompts = []
    }

    if (prompts.length === 0) {
      return NextResponse.json({ error: 'No application prompts could be found in this text.' }, { status: 422 })
    }

    const draftName = body.name?.trim() || 'Pasted Application'

    const { data: draft, error: draftError } = await service
      .from('application_drafts')
      .insert({
        user_id: user.id,
        opportunity_id: body.opportunity_id ?? null,
        document_name: draftName,
        name: draftName,
      })
      .select('id')
      .single()

    if (draftError) return NextResponse.json({ error: draftError.message }, { status: 500 })

    const promptRows = prompts.map((p, i) => ({
      draft_id: draft.id,
      position: i,
      prompt_text: p.prompt_text,
      field_type: p.field_type,
      word_limit: p.word_limit ?? null,
      answer: null,
    }))

    const { error: promptsError } = await service.from('application_prompts').insert(promptRows)
    if (promptsError) return NextResponse.json({ error: promptsError.message }, { status: 500 })

    return NextResponse.json({ draft_id: draft.id, prompt_count: prompts.length })
  }

  // ── File upload mode ───────────────────────────────────────────────────────
  const formData = await request.formData()
  const file = formData.get('file') as File | null
  const opportunityId = formData.get('opportunity_id') as string | null

  if (!file) return NextResponse.json({ error: 'No file uploaded.' }, { status: 400 })
  if (!sanitizeFilename(file.name)) return NextResponse.json({ error: 'Invalid filename.' }, { status: 400 })
  if (!ALLOWED_MIME_TYPES.includes(file.type)) {
    return NextResponse.json({ error: 'Only PDF and DOCX files are accepted.' }, { status: 400 })
  }
  if (file.size > MAX_FILE_SIZE) {
    return NextResponse.json({ error: 'File must be under 5MB.' }, { status: 400 })
  }

  const buffer = Buffer.from(await file.arrayBuffer())

  let extractedText: string
  try {
    extractedText = await extractText(buffer, file.type)
  } catch {
    return NextResponse.json({ error: 'Could not read file. Make sure it is not password-protected.' }, { status: 422 })
  }

  if (!extractedText.trim()) {
    return NextResponse.json({ error: 'No readable text found in this file.' }, { status: 422 })
  }

  let prompts: ExtractedPrompt[]
  try {
    prompts = await extractPrompts(extractedText)
  } catch {
    prompts = []
  }

  if (prompts.length === 0) {
    return NextResponse.json({ error: 'No application prompts could be found in this document.' }, { status: 422 })
  }

  const defaultName = file.name.replace(/\.(pdf|docx)$/i, '')

  const { data: draft, error: draftError } = await service
    .from('application_drafts')
    .insert({
      user_id: user.id,
      opportunity_id: opportunityId ?? null,
      document_name: file.name,
      name: defaultName,
    })
    .select('id')
    .single()

  if (draftError) return NextResponse.json({ error: draftError.message }, { status: 500 })

  const promptRows = prompts.map((p, i) => ({
    draft_id: draft.id,
    position: i,
    prompt_text: p.prompt_text,
    field_type: p.field_type,
    word_limit: p.word_limit ?? null,
    answer: null,
  }))

  const { error: promptsError } = await service.from('application_prompts').insert(promptRows)
  if (promptsError) return NextResponse.json({ error: promptsError.message }, { status: 500 })

  return NextResponse.json({ draft_id: draft.id, prompt_count: prompts.length })
}

// GET /api/application-drafts — list user's drafts
export async function GET() {
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Authentication required.' }, { status: 401 })

  const service = createSupabaseServiceClient()
  const { data, error } = await service
    .from('application_drafts')
    .select(`
      id, document_name, name, priority, deadline, created_at, opportunity_id,
      opportunities (id, title, organization),
      application_prompts (id, position, prompt_text, field_type, word_limit, answer)
    `)
    .eq('user_id', user.id)
    .order('created_at', { ascending: false })

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })
  return NextResponse.json({ drafts: data })
}
