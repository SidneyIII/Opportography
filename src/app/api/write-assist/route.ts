import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'
import { createSupabaseServerClient } from '@/lib/supabase-server'

const anthropic = new Anthropic({ apiKey: process.env.ANTHROPIC_API_KEY })

const writeRateStore = new Map<string, { count: number; resetAt: number }>()
const WRITE_LIMIT = 30
const WRITE_WINDOW_MS = 60 * 60 * 1000

function checkWriteRateLimit(userId: string): { allowed: boolean; remaining: number } {
  const now = Date.now()
  const record = writeRateStore.get(userId)
  if (!record || now > record.resetAt) {
    writeRateStore.set(userId, { count: 1, resetAt: now + WRITE_WINDOW_MS })
    return { allowed: true, remaining: WRITE_LIMIT - 1 }
  }
  if (record.count >= WRITE_LIMIT) return { allowed: false, remaining: 0 }
  record.count++
  return { allowed: true, remaining: WRITE_LIMIT - record.count }
}

const WRITING_SYSTEM_PROMPT = `You are an expert application writing coach helping students craft compelling resumes, cover letters, personal statements, and application essays. You serve students in the Omaha/Council Bluffs and Akron area applying to real local opportunities — jobs, scholarships, internships, trade programs, and college applications.

Your role:
- Help students write authentically and compellingly in their own voice
- Give specific, actionable feedback — always quote the student's actual words when reviewing their writing
- Suggest concrete improvements to sentences, paragraphs, and structure
- Help students identify and articulate their unique strengths and experiences
- Review complete documents and give honest, constructive assessments
- Help with resume formatting, cover letter structure, essay outlines, and personal statements
- When writing drafts, sound like a real student — not corporate or overly formal
- Encourage students to customize any AI-generated content and make it their own

Be direct, warm, and specific. Never give generic advice — always engage with what the student actually shared. If they paste text, respond specifically to that text, not generically.

Format responses in clean readable markdown. Keep responses focused and practical — 150-250 words for feedback, up to 400 for full drafts. Never use emoji.

You do NOT search for opportunities or discuss which programs to apply to — your focus is purely on helping the student write the strongest possible application materials.`

export async function POST(request: Request) {
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Authentication required.' }, { status: 401 })

  const { allowed, remaining } = checkWriteRateLimit(user.id)
  if (!allowed) {
    return NextResponse.json(
      { error: 'You\'ve reached the writing assist limit for this hour. Try again soon.' },
      { status: 429 }
    )
  }

  let body: {
    messages?: { role: string; content: string }[]
    context?: { draftName?: string; opportunityTitle?: string; currentPromptText?: string }
    mode?: 'chat' | 'quick_review'
    reviewData?: { prompts: { prompt_text: string; answer: string }[] }
  }
  try {
    body = await request.json()
  } catch {
    return NextResponse.json({ error: 'Invalid request.' }, { status: 400 })
  }

  // Quick Review mode — holistic assessment of all answers
  if (body.mode === 'quick_review' && body.reviewData) {
    const { prompts } = body.reviewData
    const ctx = body.context
    const formatted = prompts
      .map((p, i) => `Prompt ${i + 1}: "${p.prompt_text}"\nAnswer: ${p.answer || '(no answer yet)'}`)
      .join('\n\n')

    const reviewPrompt = `${ctx?.draftName ? `Application: ${ctx.draftName}` : ''}${ctx?.opportunityTitle ? `\nOpportunity: ${ctx.opportunityTitle}` : ''}

Please give a Quick Review of this application. Be honest and specific.

Structure your response exactly as:
**Overall Strength:** [score 1-10] — [one sentence verdict]

**What's Working:**
[2-3 specific bullet points citing actual text]

**Needs Improvement:**
[2-3 specific bullet points with concrete suggestions]

**Ready to Submit?** [Yes / Almost / Not Yet] — [one sentence explanation]

---

${formatted}`

    try {
      const response = await anthropic.messages.create({
        model: 'claude-sonnet-4-6',
        max_tokens: 600,
        system: WRITING_SYSTEM_PROMPT,
        messages: [{ role: 'user', content: reviewPrompt }],
      })
      const reply = response.content[0]?.type === 'text' ? response.content[0].text : ''
      return NextResponse.json({ reply, remaining })
    } catch {
      return NextResponse.json({ error: 'Review failed. Please try again.' }, { status: 500 })
    }
  }

  // Chat mode
  const messages = body.messages ?? []
  if (messages.length === 0) return NextResponse.json({ error: 'No messages.' }, { status: 400 })

  const ctx = body.context
  const contextNote = ctx ? [
    ctx.draftName ? `Application: ${ctx.draftName}` : null,
    ctx.opportunityTitle ? `Opportunity: ${ctx.opportunityTitle}` : null,
    ctx.currentPromptText ? `Current prompt they are working on: "${ctx.currentPromptText}"` : null,
  ].filter(Boolean).join('\n') : ''

  const apiMessages = messages.map((m) => ({
    role: m.role as 'user' | 'assistant',
    content: m.content,
  }))

  if (contextNote && apiMessages.length > 0 && apiMessages[0].role === 'user') {
    apiMessages[0] = {
      ...apiMessages[0],
      content: `[Context]\n${contextNote}\n\n${apiMessages[0].content}`,
    }
  }

  try {
    const response = await anthropic.messages.create({
      model: 'claude-sonnet-4-6',
      max_tokens: 600,
      system: WRITING_SYSTEM_PROMPT,
      messages: apiMessages,
    })
    const reply = response.content[0]?.type === 'text' ? response.content[0].text : ''
    return NextResponse.json({ reply, remaining })
  } catch {
    return NextResponse.json({ error: 'Writing assist failed. Please try again.' }, { status: 500 })
  }
}
