'use client'

import { useState, useEffect, useCallback, use } from 'react'
import Link from 'next/link'
import { PDFDocument, StandardFonts, rgb } from 'pdf-lib'

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
  opportunity_id: string | null
  opportunities: { id: string; title: string; organization: string } | null
  application_prompts: Prompt[]
}

function wordCount(text: string): number {
  return text.trim().split(/\s+/).filter(Boolean).length
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

  const fetchDraft = useCallback(async () => {
    const res = await fetch(`/api/application-drafts/${draftId}`)
    if (res.ok) {
      const { draft: d } = await res.json()
      setDraft(d)
      // Initialize answers from saved data
      const saved: Record<string, string> = {}
      for (const p of (d.application_prompts as Prompt[])) {
        saved[p.id] = p.answer ?? ''
      }
      setAnswers(saved)
    }
    setLoading(false)
  }, [draftId])

  useEffect(() => { fetchDraft() }, [fetchDraft])

  const prompts = draft?.application_prompts
    ? [...draft.application_prompts].sort((a, b) => a.position - b.position)
    : []

  const currentPrompt = prompts[currentIndex]
  const currentAnswer = currentPrompt ? (answers[currentPrompt.id] ?? '') : ''

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

    // Title
    page.drawText(draft.document_name, { x: margin, y, font: boldFont, size: 16, color: rgb(0.1, 0.1, 0.1) })
    y -= 24
    if (draft.opportunities) {
      page.drawText(`${draft.opportunities.title} — ${draft.opportunities.organization}`, { x: margin, y, font, size: 11, color: rgb(0.4, 0.4, 0.4) })
      y -= 20
    }
    y -= 16

    for (const prompt of prompts) {
      const answer = answers[prompt.id] ?? ''
      // Remove AI watermark from export display (kept in text but noted)
      const cleanAnswer = answer.replace(/\[AI-assisted draft — make it yours before submitting\]/g, '').trim()

      // Check if we need a new page
      const estimatedLines = Math.ceil((prompt.prompt_text.length + cleanAnswer.length) / 80) + 4
      if (y - estimatedLines * lineHeight < margin) {
        page = addPage()
        y = pageHeight - margin
      }

      // Prompt label
      page.drawText(`Q${prompt.position + 1}: ${prompt.prompt_text.slice(0, 120)}${prompt.prompt_text.length > 120 ? '...' : ''}`, {
        x: margin, y, font: boldFont, size: 11, color: rgb(0.1, 0.1, 0.1),
      })
      y -= lineHeight + 4

      // Answer
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
    a.download = `${draft.document_name.replace(/\.(pdf|docx)$/i, '')}-responses.pdf`
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
        <Link href="/apply" className="mt-4 inline-block text-sm text-cyan-400 hover:text-cyan-300">← Back to Application Center</Link>
      </div>
    )
  }

  const answeredCount = prompts.filter((p) => answers[p.id]?.trim()).length
  const allAnswered = answeredCount === prompts.length

  return (
    <div className="mx-auto max-w-5xl px-4 py-8">
      {/* Header */}
      <div className="mb-6 flex items-center justify-between gap-4">
        <div className="min-w-0">
          <Link href="/apply" className="text-xs text-slate-600 hover:text-slate-400 transition-colors">← Application Center</Link>
          <h1 className="font-display mt-1 text-xl font-bold text-slate-50 truncate">{draft.document_name}</h1>
          {draft.opportunities && (
            <p className="text-sm text-slate-500">{draft.opportunities.title} — {draft.opportunities.organization}</p>
          )}
        </div>
        <button
          onClick={exportPdf}
          disabled={exporting || !allAnswered}
          className="shrink-0 rounded-lg bg-cyan-400 px-4 py-2.5 text-sm font-semibold text-navy-950 transition-all hover:bg-cyan-300 disabled:opacity-40"
          title={!allAnswered ? 'Answer all prompts to export' : ''}
        >
          {exporting ? 'Exporting...' : 'Export PDF'}
        </button>
      </div>

      {/* Progress bar */}
      <div className="mb-6">
        <div className="mb-1.5 flex items-center justify-between text-xs text-slate-500">
          <span>Prompt {currentIndex + 1} of {prompts.length}</span>
          <span>{answeredCount} answered</span>
        </div>
        <div className="h-1.5 rounded-full bg-navy-700">
          <div
            className="h-1.5 rounded-full bg-cyan-400 transition-all"
            style={{ width: `${((currentIndex + 1) / prompts.length) * 100}%` }}
          />
        </div>
      </div>

      <div className="grid gap-6 lg:grid-cols-[1fr_280px]">
        {/* Main editor */}
        <div className="space-y-4">
          {/* Prompt */}
          <div className="rounded-xl border border-navy-600 bg-navy-800 p-5">
            <div className="mb-3 flex items-center gap-2">
              <span className="rounded-full bg-cyan-400/10 px-2.5 py-0.5 text-xs font-semibold text-cyan-400 border border-cyan-400/20">
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
              style={{ minHeight: '180px' }}
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

          {/* AI result panel */}
          {aiResult && (
            <div className="rounded-xl border border-cyan-400/20 bg-cyan-400/5 p-4">
              <div className="mb-3 flex items-center justify-between">
                <span className="text-xs font-semibold text-cyan-400">
                  {aiMode === 'brainstorm' ? 'Angles to consider' : 'AI Draft'}
                </span>
                <button onClick={() => setAiResult(null)} className="text-slate-600 hover:text-slate-400 transition-colors">
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
                {allAnswered ? 'Export PDF' : `${prompts.length - answeredCount} prompts remaining`}
              </button>
            )}
          </div>
        </div>

        {/* Sidebar: prompt navigator */}
        <div className="hidden lg:block">
          <div className="rounded-xl border border-navy-600 bg-navy-800 p-4 sticky top-6">
            <p className="mb-3 text-xs font-semibold uppercase tracking-wider text-slate-500">Prompts</p>
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
        </div>
      </div>
    </div>
  )
}
