'use client'

import { useState, useEffect, useCallback, useRef, use } from 'react'
import Link from 'next/link'
import { PDFDocument, StandardFonts, rgb } from 'pdf-lib'

type Priority = 'high' | 'medium' | 'low' | 'none'
type SidebarTab = 'prompts' | 'write' | 'scratchpad'

interface Prompt {
  id: string
  position: number
  prompt_text: string
  field_type: string
  word_limit: number | null
  answer: string | null
}

interface Draft {
  id: string
  document_name: string
  name: string | null
  priority: Priority
  deadline: string | null
  scratchpad: string | null
  opportunity_id: string | null
  opportunities: { id: string; title: string; organization: string } | null
  application_prompts: Prompt[]
}

interface ChatMessage {
  role: 'user' | 'assistant'
  content: string
}

const PRIORITY_LABELS: Record<Priority, string> = { high: 'High', medium: 'Medium', low: 'Low', none: 'None' }
const PRIORITY_STYLES: Record<Priority, string> = {
  high: 'text-rose-400 border-rose-400/30 bg-rose-400/10',
  medium: 'text-amber-400 border-amber-400/30 bg-amber-400/10',
  low: 'text-cyan-400 border-cyan-400/30 bg-cyan-400/10',
  none: 'text-slate-500 border-slate-600/30 bg-slate-600/10',
}

function wordCount(text: string): number {
  return text.trim().split(/\s+/).filter(Boolean).length
}

function renderMarkdown(text: string): React.ReactNode[] {
  return text.split('\n').map((line, i) => {
    // Bold
    const parts: React.ReactNode[] = []
    const boldRegex = /\*\*(.+?)\*\*/g
    let last = 0
    let m: RegExpExecArray | null
    while ((m = boldRegex.exec(line)) !== null) {
      if (m.index > last) parts.push(line.slice(last, m.index))
      parts.push(<strong key={m.index}>{m[1]}</strong>)
      last = m.index + m[0].length
    }
    if (last < line.length) parts.push(line.slice(last))
    return <span key={i}>{parts}<br /></span>
  })
}

export default function DraftEditorPage({ params }: { params: Promise<{ draftId: string }> }) {
  const { draftId } = use(params)
  const [draft, setDraft] = useState<Draft | null>(null)
  const [loading, setLoading] = useState(true)
  const [currentIndex, setCurrentIndex] = useState(0)
  const [answers, setAnswers] = useState<Record<string, string>>({})
  const [saving, setSaving] = useState(false)
  const [aiLoading, setAiLoading] = useState(false)
  const [aiResult, setAiResult] = useState<string | null>(null)
  const [aiMode, setAiMode] = useState<'brainstorm' | 'draft' | null>(null)
  const [exporting, setExporting] = useState(false)

  // Meta editing
  const [editingName, setEditingName] = useState(false)
  const [draftName, setDraftName] = useState('')
  const [priority, setPriority] = useState<Priority>('none')
  const [deadline, setDeadline] = useState('')
  const nameInputRef = useRef<HTMLInputElement>(null)

  // Sidebar
  const [sidebarTab, setSidebarTab] = useState<SidebarTab>('prompts')

  // Scratchpad
  const [scratchpad, setScratchpad] = useState('')
  const [scratchpadSaving, setScratchpadSaving] = useState(false)

  // Write assist chat
  const [chatMessages, setChatMessages] = useState<ChatMessage[]>([])
  const [chatInput, setChatInput] = useState('')
  const [chatLoading, setChatLoading] = useState(false)
  const [chatRemaining, setChatRemaining] = useState<number | null>(null)
  const chatEndRef = useRef<HTMLDivElement>(null)

  // Quick review
  const [reviewResult, setReviewResult] = useState<string | null>(null)
  const [reviewLoading, setReviewLoading] = useState(false)
  const [showReview, setShowReview] = useState(false)

  const fetchDraft = useCallback(async () => {
    const res = await fetch(`/api/application-drafts/${draftId}`)
    if (res.ok) {
      const { draft: d } = await res.json()
      setDraft(d)
      const saved: Record<string, string> = {}
      for (const p of (d.application_prompts as Prompt[])) {
        saved[p.id] = p.answer ?? ''
      }
      setAnswers(saved)
      setDraftName(d.name || d.document_name)
      setPriority(d.priority ?? 'none')
      setDeadline(d.deadline ?? '')
      setScratchpad(d.scratchpad ?? '')
    }
    setLoading(false)
  }, [draftId])

  useEffect(() => { fetchDraft() }, [fetchDraft])

  useEffect(() => {
    if (editingName && nameInputRef.current) nameInputRef.current.focus()
  }, [editingName])

  useEffect(() => {
    chatEndRef.current?.scrollIntoView({ behavior: 'smooth' })
  }, [chatMessages])

  const prompts = draft?.application_prompts
    ? [...draft.application_prompts].sort((a, b) => a.position - b.position)
    : []

  const currentPrompt = prompts[currentIndex]
  const currentAnswer = currentPrompt ? (answers[currentPrompt.id] ?? '') : ''
  const answeredCount = prompts.filter((p) => answers[p.id]?.trim()).length
  const readinessPct = prompts.length === 0 ? 0 : Math.round((answeredCount / prompts.length) * 100)
  const allAnswered = answeredCount === prompts.length && prompts.length > 0

  async function saveAnswer() {
    if (!currentPrompt) return
    setSaving(true)
    await fetch(`/api/application-drafts/${draftId}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ prompt_id: currentPrompt.id, answer: currentAnswer }),
    })
    setSaving(false)
  }

  async function saveMeta(updates: Partial<{ name: string; priority: Priority; deadline: string | null; scratchpad: string }>) {
    await fetch(`/api/application-drafts/${draftId}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(updates),
    })
  }

  async function commitName() {
    setEditingName(false)
    const name = draftName.trim() || (draft?.document_name ?? '')
    setDraftName(name)
    await saveMeta({ name })
  }

  async function handlePriorityChange(p: Priority) {
    setPriority(p)
    await saveMeta({ priority: p })
  }

  async function handleDeadlineChange(d: string) {
    setDeadline(d)
    await saveMeta({ deadline: d || null })
  }

  async function saveScratchpad() {
    setScratchpadSaving(true)
    await saveMeta({ scratchpad })
    setScratchpadSaving(false)
  }

  async function handleAiAssist(mode: 'brainstorm' | 'draft') {
    if (!currentPrompt) return
    setAiLoading(true)
    setAiResult(null)
    setAiMode(mode)
    const res = await fetch(`/api/application-drafts/${draftId}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ prompt_id: currentPrompt.id, mode }),
    })
    const data = await res.json()
    setAiResult(data.result ?? data.error ?? 'Something went wrong.')
    setAiLoading(false)
  }

  function useAiDraft() {
    if (!currentPrompt || !aiResult) return
    setAnswers((prev) => ({ ...prev, [currentPrompt.id]: aiResult }))
    setAiResult(null)
  }

  async function goTo(index: number) {
    await saveAnswer()
    setAiResult(null)
    setCurrentIndex(index)
  }

  async function sendChatMessage() {
    if (!chatInput.trim() || chatLoading) return
    const userMsg: ChatMessage = { role: 'user', content: chatInput }
    const newMessages = [...chatMessages, userMsg]
    setChatMessages(newMessages)
    setChatInput('')
    setChatLoading(true)

    const res = await fetch('/api/write-assist', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        mode: 'chat',
        messages: newMessages,
        context: {
          draftName: draftName || draft?.document_name,
          opportunityTitle: draft?.opportunities?.title,
          currentPromptText: currentPrompt?.prompt_text,
        },
      }),
    })
    const data = await res.json()
    if (data.reply) {
      setChatMessages((prev) => [...prev, { role: 'assistant', content: data.reply }])
    }
    if (typeof data.remaining === 'number') setChatRemaining(data.remaining)
    setChatLoading(false)
  }

  async function runQuickReview() {
    setReviewLoading(true)
    setReviewResult(null)
    setShowReview(true)
    const res = await fetch('/api/write-assist', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        mode: 'quick_review',
        context: {
          draftName: draftName || draft?.document_name,
          opportunityTitle: draft?.opportunities?.title,
        },
        reviewData: {
          prompts: prompts.map((p) => ({
            prompt_text: p.prompt_text,
            answer: answers[p.id] ?? '',
          })),
        },
      }),
    })
    const data = await res.json()
    setReviewResult(data.reply ?? data.error ?? 'Review failed.')
    setReviewLoading(false)
  }

  async function exportPdf() {
    if (!draft) return
    setExporting(true)

    const pdfDoc = await PDFDocument.create()
    const font = await pdfDoc.embedFont(StandardFonts.Helvetica)
    const boldFont = await pdfDoc.embedFont(StandardFonts.HelveticaBold)

    const margin = 50
    const pageWidth = 595
    const pageHeight = 842
    const maxWidth = pageWidth - margin * 2
    const lineHeight = 16

    function addPage() {
      return pdfDoc.addPage([pageWidth, pageHeight])
    }

    function wrapText(text: string, maxW: number, fnt: typeof font, size: number): string[] {
      const words = text.split(' ')
      const lines: string[] = []
      let current = ''
      for (const word of words) {
        const test = current ? `${current} ${word}` : word
        if (fnt.widthOfTextAtSize(test, size) > maxW) {
          if (current) lines.push(current)
          current = word
        } else {
          current = test
        }
      }
      if (current) lines.push(current)
      return lines
    }

    let page = addPage()
    let y = pageHeight - margin

    const title = draftName || draft.document_name
    page.drawText(title, { x: margin, y, font: boldFont, size: 16, color: rgb(0.1, 0.1, 0.1) })
    y -= 24
    if (draft.opportunities) {
      page.drawText(`${draft.opportunities.title} — ${draft.opportunities.organization}`, {
        x: margin, y, font, size: 11, color: rgb(0.4, 0.4, 0.4),
      })
      y -= 20
    }
    y -= 16

    for (const prompt of prompts) {
      const answer = answers[prompt.id] ?? ''
      const cleanAnswer = answer.replace(/\[AI-assisted draft — make it yours before submitting\]/g, '').trim()

      const estimatedLines = Math.ceil((prompt.prompt_text.length + cleanAnswer.length) / 80) + 4
      if (y - estimatedLines * lineHeight < margin) {
        page = addPage()
        y = pageHeight - margin
      }

      page.drawText(`Q${prompt.position + 1}: ${prompt.prompt_text.slice(0, 120)}${prompt.prompt_text.length > 120 ? '...' : ''}`, {
        x: margin, y, font: boldFont, size: 11, color: rgb(0.1, 0.1, 0.1),
      })
      y -= lineHeight + 4

      const answerLines = wrapText(cleanAnswer || '(No answer provided)', maxWidth, font, 11)
      for (const line of answerLines) {
        if (y < margin) { page = addPage(); y = pageHeight - margin }
        page.drawText(line, { x: margin, y, font, size: 11, color: rgb(0.2, 0.2, 0.2) })
        y -= lineHeight
      }
      y -= 20
    }

    const bytes = await pdfDoc.save()
    const blob = new Blob([bytes as unknown as BlobPart], { type: 'application/pdf' })
    const url = URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = `${title.replace(/\.(pdf|docx)$/i, '')}-responses.pdf`
    a.click()
    URL.revokeObjectURL(url)
    setExporting(false)
  }

  if (loading) {
    return <div className="py-24 text-center text-sm text-slate-500">Loading your draft...</div>
  }

  if (!draft || prompts.length === 0) {
    return (
      <div className="mx-auto max-w-2xl px-4 py-16 text-center">
        <p className="text-slate-400">Draft not found or has no prompts.</p>
        <Link href="/apply" className="mt-4 inline-block text-sm text-cyan-400 hover:text-cyan-300">
          ← Back to Application Center
        </Link>
      </div>
    )
  }

  const readinessColor = readinessPct >= 80 ? 'bg-emerald-400' : readinessPct >= 50 ? 'bg-amber-400' : 'bg-cyan-400'
  const readinessLabel = readinessPct >= 80 ? 'text-emerald-400' : readinessPct >= 50 ? 'text-amber-400' : 'text-cyan-400'

  return (
    <div className="mx-auto max-w-5xl px-4 py-8">

      {/* ── Header ──────────────────────────────────────────────────────────── */}
      <div className="mb-6 rounded-2xl border border-navy-600 bg-navy-800 p-5">
        <div className="flex flex-wrap items-start justify-between gap-4">
          <div className="min-w-0 flex-1">
            <Link href="/apply" className="text-xs text-slate-600 hover:text-slate-400 transition-colors">
              ← Application Center
            </Link>

            {/* Editable name */}
            <div className="mt-1 flex items-center gap-2">
              {editingName ? (
                <input
                  ref={nameInputRef}
                  value={draftName}
                  onChange={(e) => setDraftName(e.target.value)}
                  onBlur={commitName}
                  onKeyDown={(e) => { if (e.key === 'Enter') commitName() }}
                  className="font-display text-xl font-bold text-slate-50 bg-transparent border-b border-cyan-400/50 outline-none w-full max-w-sm"
                />
              ) : (
                <button
                  onClick={() => setEditingName(true)}
                  className="group flex items-center gap-2"
                  title="Click to rename"
                >
                  <h1 className="font-display text-xl font-bold text-slate-50">{draftName}</h1>
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"
                    className="h-3.5 w-3.5 text-slate-600 opacity-0 group-hover:opacity-100 transition-opacity">
                    <path strokeLinecap="round" strokeLinejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L6.832 19.82a4.5 4.5 0 0 1-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 0 1 1.13-1.897L16.863 4.487Z" />
                  </svg>
                </button>
              )}
            </div>

            {draft.opportunities && (
              <p className="mt-0.5 text-sm text-slate-500">
                {draft.opportunities.title} — {draft.opportunities.organization}
              </p>
            )}

            {/* Priority + Deadline row */}
            <div className="mt-3 flex flex-wrap items-center gap-3">
              {/* Priority selector */}
              <div className="flex items-center gap-2">
                <span className="text-xs text-slate-600">Priority:</span>
                <select
                  value={priority}
                  onChange={(e) => handlePriorityChange(e.target.value as Priority)}
                  className={`rounded-full border px-2.5 py-0.5 text-xs font-semibold bg-transparent outline-none cursor-pointer ${PRIORITY_STYLES[priority]}`}
                >
                  {(['high', 'medium', 'low', 'none'] as const).map((p) => (
                    <option key={p} value={p} className="bg-navy-900 text-slate-200">{PRIORITY_LABELS[p]}</option>
                  ))}
                </select>
              </div>

              {/* Deadline picker */}
              <div className="flex items-center gap-2">
                <span className="text-xs text-slate-600">Deadline:</span>
                <input
                  type="date"
                  value={deadline}
                  onChange={(e) => handleDeadlineChange(e.target.value)}
                  className="rounded-lg border border-navy-600 bg-navy-900 px-2.5 py-0.5 text-xs text-slate-300 outline-none focus:border-cyan-400/50"
                />
              </div>
            </div>
          </div>

          {/* Right actions */}
          <div className="flex shrink-0 items-center gap-2">
            <button
              onClick={runQuickReview}
              disabled={reviewLoading}
              className="flex items-center gap-2 rounded-lg border border-violet-400/30 bg-violet-400/10 px-4 py-2 text-xs font-semibold text-violet-400 transition-all hover:bg-violet-400/20 disabled:opacity-40"
            >
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" className="h-3.5 w-3.5">
                <path strokeLinecap="round" strokeLinejoin="round" d="M9 12.75 11.25 15 15 9.75M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
              </svg>
              {reviewLoading ? 'Reviewing...' : 'Quick Review'}
            </button>
            <button
              onClick={exportPdf}
              disabled={exporting || !allAnswered}
              className="rounded-lg bg-cyan-400 px-4 py-2 text-xs font-semibold text-navy-950 transition-all hover:bg-cyan-300 disabled:opacity-40"
              title={!allAnswered ? 'Answer all prompts to export' : ''}
            >
              {exporting ? 'Exporting...' : 'Export PDF'}
            </button>
          </div>
        </div>

        {/* Readiness bar */}
        <div className="mt-4 border-t border-navy-600 pt-4">
          <div className="flex items-center justify-between mb-1.5">
            <span className="text-xs text-slate-500">Application readiness</span>
            <span className={`text-xs font-bold ${readinessLabel}`}>{readinessPct}%</span>
          </div>
          <div className="h-2 rounded-full bg-navy-700">
            <div className={`h-2 rounded-full transition-all ${readinessColor}`} style={{ width: `${readinessPct}%` }} />
          </div>
          <p className="mt-1 text-xs text-slate-600">{answeredCount} of {prompts.length} prompts answered</p>
        </div>
      </div>

      {/* ── Quick Review panel ──────────────────────────────────────────────── */}
      {showReview && (
        <div className="mb-6 rounded-2xl border border-violet-400/20 bg-violet-400/5 p-5">
          <div className="mb-3 flex items-center justify-between">
            <span className="text-sm font-semibold text-violet-400">Quick Review</span>
            <button onClick={() => { setShowReview(false); setReviewResult(null) }} className="text-slate-600 hover:text-slate-400">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="h-4 w-4">
                <path strokeLinecap="round" strokeLinejoin="round" d="M6 18 18 6M6 6l12 12" />
              </svg>
            </button>
          </div>
          {reviewLoading ? (
            <div className="flex items-center gap-3">
              <div className="h-5 w-5 animate-spin rounded-full border-2 border-violet-400 border-t-transparent" />
              <span className="text-sm text-slate-400">Analyzing your application...</span>
            </div>
          ) : reviewResult ? (
            <div className="prose-sm text-sm leading-relaxed text-slate-300 space-y-1">
              {renderMarkdown(reviewResult)}
            </div>
          ) : null}
        </div>
      )}

      {/* ── Main layout ─────────────────────────────────────────────────────── */}
      <div className="grid gap-6 lg:grid-cols-[1fr_300px]">

        {/* Editor */}
        <div className="space-y-4">
          {/* Prompt nav row */}
          <div className="flex items-center justify-between text-xs text-slate-500">
            <span>Prompt {currentIndex + 1} of {prompts.length}</span>
          </div>

          {/* Current prompt */}
          <div className="rounded-xl border border-navy-600 bg-navy-800 p-5">
            <div className="mb-3 flex items-center gap-2">
              <span className="rounded-full border border-cyan-400/20 bg-cyan-400/10 px-2.5 py-0.5 text-xs font-semibold text-cyan-400">
                {currentPrompt.field_type.replace('_', ' ')}
              </span>
              {currentPrompt.word_limit && (
                <span className="text-xs text-slate-500">{currentPrompt.word_limit} word limit</span>
              )}
            </div>
            <p className="text-sm leading-relaxed text-slate-200">{currentPrompt.prompt_text}</p>
          </div>

          {/* Answer editor */}
          <div className="rounded-xl border border-navy-600 bg-navy-800 p-4">
            <textarea
              value={currentAnswer}
              onChange={(e) => setAnswers((prev) => ({ ...prev, [currentPrompt.id]: e.target.value }))}
              onBlur={saveAnswer}
              placeholder="Write your response here..."
              className="w-full resize-none rounded-lg border border-navy-700 bg-navy-900 px-4 py-3 text-sm text-slate-100 placeholder-slate-600 outline-none transition-colors focus:border-cyan-400/50 min-h-[180px]"
            />
            <div className="mt-2 flex items-center justify-between">
              <span className="text-xs text-slate-600">
                {wordCount(currentAnswer)} words
                {currentPrompt.word_limit && (
                  <span className={wordCount(currentAnswer) > currentPrompt.word_limit ? ' text-rose-400' : ''}>
                    {' '}/ {currentPrompt.word_limit}
                  </span>
                )}
              </span>
              <span className="text-xs text-slate-700">{saving ? 'Saving...' : 'Auto-saved'}</span>
            </div>
          </div>

          {/* AI assist buttons */}
          <div className="flex gap-3">
            <button
              onClick={() => handleAiAssist('brainstorm')}
              disabled={aiLoading}
              className="flex items-center gap-2 rounded-lg border border-cyan-400/20 bg-cyan-400/5 px-4 py-2.5 text-sm font-medium text-cyan-400 transition-all hover:bg-cyan-400/10 disabled:opacity-40"
            >
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" className="h-4 w-4">
                <path strokeLinecap="round" strokeLinejoin="round" d="M12 18v-5.25m0 0a6.01 6.01 0 0 0 1.5-.189m-1.5.189a6.01 6.01 0 0 1-1.5-.189m3.75 7.478a12.06 12.06 0 0 1-4.5 0m3.75 2.383a14.406 14.406 0 0 1-3 0M14.25 18v-.192c0-.983.658-1.823 1.508-2.316a7.5 7.5 0 1 0-7.517 0c.85.493 1.509 1.333 1.509 2.316V18" />
              </svg>
              {aiLoading && aiMode === 'brainstorm' ? 'Thinking...' : 'Brainstorm angles'}
            </button>
            <button
              onClick={() => handleAiAssist('draft')}
              disabled={aiLoading}
              className="flex items-center gap-2 rounded-lg border border-navy-600 bg-navy-800 px-4 py-2.5 text-sm font-medium text-slate-300 transition-all hover:border-cyan-400/30 hover:text-slate-100 disabled:opacity-40"
            >
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" className="h-4 w-4">
                <path strokeLinecap="round" strokeLinejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10" />
              </svg>
              {aiLoading && aiMode === 'draft' ? 'Drafting...' : 'Draft a response'}
            </button>
          </div>

          {/* AI result */}
          {aiResult && (
            <div className="rounded-xl border border-cyan-400/20 bg-cyan-400/5 p-4">
              <div className="mb-3 flex items-center justify-between">
                <span className="text-xs font-semibold text-cyan-400">
                  {aiMode === 'brainstorm' ? 'Angles to consider' : 'AI Draft'}
                </span>
                <button onClick={() => setAiResult(null)} className="text-slate-600 hover:text-slate-400">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="h-4 w-4">
                    <path strokeLinecap="round" strokeLinejoin="round" d="M6 18 18 6M6 6l12 12" />
                  </svg>
                </button>
              </div>
              <p className="whitespace-pre-wrap text-sm leading-relaxed text-slate-300">{aiResult}</p>
              {aiMode === 'draft' && (
                <button
                  onClick={useAiDraft}
                  className="mt-3 rounded-lg bg-cyan-400 px-4 py-2 text-xs font-semibold text-navy-950 transition-all hover:bg-cyan-300"
                >
                  Use this draft
                </button>
              )}
            </div>
          )}

          {/* Prev / Next */}
          <div className="flex items-center justify-between pt-2">
            <button
              onClick={() => goTo(currentIndex - 1)}
              disabled={currentIndex === 0}
              className="rounded-lg border border-navy-600 px-4 py-2 text-sm text-slate-400 transition-all hover:border-slate-500 hover:text-slate-200 disabled:opacity-30"
            >
              ← Previous
            </button>
            {currentIndex < prompts.length - 1 ? (
              <button
                onClick={() => goTo(currentIndex + 1)}
                className="rounded-lg bg-cyan-400 px-4 py-2 text-sm font-semibold text-navy-950 transition-all hover:bg-cyan-300"
              >
                Next →
              </button>
            ) : (
              <button
                onClick={exportPdf}
                disabled={exporting || !allAnswered}
                className="rounded-lg bg-emerald-400 px-4 py-2 text-sm font-semibold text-navy-950 transition-all hover:bg-emerald-300 disabled:opacity-40"
              >
                {allAnswered ? 'Export PDF' : `${prompts.length - answeredCount} remaining`}
              </button>
            )}
          </div>
        </div>

        {/* Sidebar */}
        <div className="hidden lg:block">
          <div className="rounded-xl border border-navy-600 bg-navy-800 sticky top-6 overflow-hidden">
            {/* Sidebar tabs */}
            <div className="flex border-b border-navy-600">
              {([
                { key: 'prompts', label: 'Prompts' },
                { key: 'write', label: 'Write Assist' },
                { key: 'scratchpad', label: 'Notes' },
              ] as const).map(({ key, label }) => (
                <button
                  key={key}
                  onClick={() => setSidebarTab(key)}
                  className={`flex-1 py-2.5 text-xs font-medium transition-all ${
                    sidebarTab === key
                      ? 'border-b-2 border-cyan-400 text-cyan-400'
                      : 'text-slate-500 hover:text-slate-300'
                  }`}
                >
                  {label}
                </button>
              ))}
            </div>

            {/* ── Prompts tab ─────────────────────────────────────────────── */}
            {sidebarTab === 'prompts' && (
              <div className="p-3 max-h-[560px] overflow-y-auto">
                <div className="space-y-1">
                  {prompts.map((p, i) => {
                    const done = !!answers[p.id]?.trim()
                    return (
                      <button
                        key={p.id}
                        onClick={() => goTo(i)}
                        className={`flex w-full items-center gap-2.5 rounded-lg px-3 py-2 text-left text-xs transition-all ${
                          i === currentIndex
                            ? 'bg-cyan-400/10 text-cyan-400 border border-cyan-400/20'
                            : 'text-slate-500 hover:text-slate-300 hover:bg-navy-700'
                        }`}
                      >
                        <span className={`flex h-5 w-5 shrink-0 items-center justify-center rounded-full text-[10px] font-bold ${
                          done ? 'bg-emerald-400/20 text-emerald-400' : 'bg-navy-700 text-slate-600'
                        }`}>
                          {done ? '✓' : i + 1}
                        </span>
                        <span className="line-clamp-2 leading-snug">{p.prompt_text}</span>
                      </button>
                    )
                  })}
                </div>
              </div>
            )}

            {/* ── Write Assist tab ────────────────────────────────────────── */}
            {sidebarTab === 'write' && (
              <div className="flex flex-col" style={{ height: '520px' }}>
                <div className="border-b border-navy-600 px-3 py-2">
                  <p className="text-xs text-slate-500">Writing coach — ask anything about your application</p>
                  {chatRemaining !== null && (
                    <p className="text-[10px] text-slate-700 mt-0.5">{chatRemaining} requests remaining this hour</p>
                  )}
                </div>

                {/* Messages */}
                <div className="flex-1 overflow-y-auto p-3 space-y-3">
                  {chatMessages.length === 0 && (
                    <div className="space-y-2 pt-2">
                      <p className="text-xs text-slate-600 text-center">Try asking:</p>
                      {[
                        'Review my answer to prompt 1',
                        'Help me sound less formal',
                        'What should I highlight?',
                      ].map((s) => (
                        <button
                          key={s}
                          onClick={() => setChatInput(s)}
                          className="w-full rounded-lg border border-navy-700 px-3 py-2 text-left text-xs text-slate-500 hover:border-cyan-400/30 hover:text-slate-300 transition-all"
                        >
                          {s}
                        </button>
                      ))}
                    </div>
                  )}
                  {chatMessages.map((msg, i) => (
                    <div key={i} className={`flex ${msg.role === 'user' ? 'justify-end' : 'justify-start'}`}>
                      <div className={`max-w-[85%] rounded-xl px-3 py-2 text-xs leading-relaxed ${
                        msg.role === 'user'
                          ? 'bg-cyan-400/15 text-slate-200 border border-cyan-400/20'
                          : 'bg-navy-700 text-slate-300'
                      }`}>
                        <div className="whitespace-pre-wrap">{msg.content}</div>
                      </div>
                    </div>
                  ))}
                  {chatLoading && (
                    <div className="flex justify-start">
                      <div className="bg-navy-700 rounded-xl px-3 py-2">
                        <div className="flex gap-1">
                          <span className="h-1.5 w-1.5 animate-bounce rounded-full bg-slate-500" style={{ animationDelay: '0ms' }} />
                          <span className="h-1.5 w-1.5 animate-bounce rounded-full bg-slate-500" style={{ animationDelay: '150ms' }} />
                          <span className="h-1.5 w-1.5 animate-bounce rounded-full bg-slate-500" style={{ animationDelay: '300ms' }} />
                        </div>
                      </div>
                    </div>
                  )}
                  <div ref={chatEndRef} />
                </div>

                {/* Input */}
                <div className="border-t border-navy-600 p-2">
                  <div className="flex gap-2">
                    <textarea
                      value={chatInput}
                      onChange={(e) => setChatInput(e.target.value)}
                      onKeyDown={(e) => {
                        if (e.key === 'Enter' && !e.shiftKey) {
                          e.preventDefault()
                          sendChatMessage()
                        }
                      }}
                      placeholder="Ask your writing coach..."
                      rows={2}
                      className="flex-1 resize-none rounded-lg border border-navy-700 bg-navy-900 px-3 py-2 text-xs text-slate-100 placeholder-slate-600 outline-none focus:border-cyan-400/50"
                    />
                    <button
                      onClick={sendChatMessage}
                      disabled={!chatInput.trim() || chatLoading}
                      className="shrink-0 self-end rounded-lg bg-cyan-400 p-2 text-navy-950 transition-all hover:bg-cyan-300 disabled:opacity-40"
                    >
                      <svg viewBox="0 0 24 24" fill="currentColor" className="h-4 w-4">
                        <path d="M3.478 2.405a.75.75 0 0 0-.926.94l2.432 7.905H13.5a.75.75 0 0 1 0 1.5H4.984l-2.432 7.905a.75.75 0 0 0 .926.94 60.519 60.519 0 0 0 18.445-8.986.75.75 0 0 0 0-1.218A60.517 60.517 0 0 0 3.478 2.405Z" />
                      </svg>
                    </button>
                  </div>
                </div>
              </div>
            )}

            {/* ── Scratchpad tab ──────────────────────────────────────────── */}
            {sidebarTab === 'scratchpad' && (
              <div className="flex flex-col p-3" style={{ height: '520px' }}>
                <p className="mb-2 text-xs text-slate-500">Free-form notes for this application</p>
                <textarea
                  value={scratchpad}
                  onChange={(e) => setScratchpad(e.target.value)}
                  onBlur={saveScratchpad}
                  placeholder="Jot down ideas, key experiences to mention, reminders..."
                  className="flex-1 resize-none rounded-lg border border-navy-700 bg-navy-900 px-3 py-2.5 text-xs text-slate-100 placeholder-slate-600 outline-none transition-colors focus:border-cyan-400/50"
                />
                <p className="mt-1.5 text-[10px] text-slate-700">
                  {scratchpadSaving ? 'Saving...' : 'Auto-saved on blur'}
                </p>
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}
