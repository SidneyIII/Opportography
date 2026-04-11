'use client'

import { useState, useRef, useEffect, useCallback } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'

type Priority = 'high' | 'medium' | 'low' | 'none'
type SortKey = 'date' | 'priority' | 'deadline'
type InputTab = 'upload' | 'paste'

interface Draft {
  id: string
  document_name: string
  name: string | null
  priority: Priority
  deadline: string | null
  created_at: string
  opportunities: { id: string; title: string; organization: string } | null
  application_prompts: { id: string; answer: string | null }[]
}

const PRIORITY_ORDER: Record<Priority, number> = { high: 0, medium: 1, low: 2, none: 3 }

const PRIORITY_STYLES: Record<Priority, string> = {
  high: 'bg-rose-400/10 text-rose-400 border-rose-400/20',
  medium: 'bg-amber-400/10 text-amber-400 border-amber-400/20',
  low: 'bg-cyan-400/10 text-cyan-400 border-cyan-400/20',
  none: 'bg-slate-600/10 text-slate-500 border-slate-600/20',
}

function ProgressBar({ answered, total }: { answered: number; total: number }) {
  const pct = total === 0 ? 0 : Math.round((answered / total) * 100)
  const color = pct >= 80 ? 'bg-emerald-400' : pct >= 50 ? 'bg-amber-400' : 'bg-cyan-400'
  return (
    <div className="flex items-center gap-2">
      <div className="h-1.5 flex-1 rounded-full bg-navy-700">
        <div className={`h-1.5 rounded-full transition-all ${color}`} style={{ width: `${pct}%` }} />
      </div>
      <span className="text-xs text-slate-500 tabular-nums">{answered}/{total}</span>
    </div>
  )
}

function DeadlineBadge({ deadline }: { deadline: string | null }) {
  if (!deadline) return null
  const days = Math.ceil((new Date(deadline).getTime() - Date.now()) / (1000 * 60 * 60 * 24))
  if (days < 0) return <span className="text-xs text-slate-600">Passed</span>
  const color = days <= 7 ? 'text-rose-400' : days <= 14 ? 'text-amber-400' : 'text-slate-500'
  return (
    <span className={`text-xs ${color}`}>
      {days === 0 ? 'Due today' : days === 1 ? '1 day left' : `${days} days`}
    </span>
  )
}

function UploadZone({ onUpload }: { onUpload: (file: File) => void }) {
  const inputRef = useRef<HTMLInputElement>(null)
  const [dragging, setDragging] = useState(false)

  function handleDrop(e: React.DragEvent) {
    e.preventDefault()
    setDragging(false)
    const file = e.dataTransfer.files[0]
    if (file) onUpload(file)
  }

  return (
    <div
      onDragOver={(e) => { e.preventDefault(); setDragging(true) }}
      onDragLeave={() => setDragging(false)}
      onDrop={handleDrop}
      onClick={() => inputRef.current?.click()}
      className="cursor-pointer rounded-2xl border-2 border-dashed px-8 py-12 text-center transition-all"
      style={{ borderColor: dragging ? 'rgba(34,211,238,0.6)' : 'rgba(45,64,112,0.6)', background: dragging ? 'rgba(34,211,238,0.04)' : 'rgba(10,14,26,0.6)' }}
    >
      <div className="mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-full border border-cyan-400/20 bg-cyan-400/5">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" className="h-7 w-7 text-cyan-400">
          <path strokeLinecap="round" strokeLinejoin="round" d="M3 16.5v2.25A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75V16.5m-13.5-9L12 3m0 0 4.5 4.5M12 3v13.5" />
        </svg>
      </div>
      <p className="font-semibold text-slate-200">Drop your application document here</p>
      <p className="mt-1 text-sm text-slate-500">or click to browse — PDF or DOCX, max 5MB</p>
      <input
        ref={inputRef}
        type="file"
        accept=".pdf,.docx,application/pdf,application/vnd.openxmlformats-officedocument.wordprocessingml.document"
        className="hidden"
        onChange={(e) => { const f = e.target.files?.[0]; if (f) onUpload(f) }}
      />
    </div>
  )
}

export default function ApplyPage() {
  const [drafts, setDrafts] = useState<Draft[]>([])
  const [loading, setLoading] = useState(true)
  const [uploading, setUploading] = useState(false)
  const [uploadError, setUploadError] = useState<string | null>(null)
  const [inputTab, setInputTab] = useState<InputTab>('upload')
  const [pasteText, setPasteText] = useState('')
  const [pasteName, setPasteName] = useState('')
  const [pasteLoading, setPasteLoading] = useState(false)
  const [sortKey, setSortKey] = useState<SortKey>('date')
  const router = useRouter()

  const fetchDrafts = useCallback(async () => {
    const res = await fetch('/api/application-drafts')
    if (res.ok) {
      const { drafts: d } = await res.json()
      setDrafts(d ?? [])
    }
    setLoading(false)
  }, [])

  useEffect(() => { fetchDrafts() }, [fetchDrafts])

  async function handleUpload(file: File) {
    setUploading(true)
    setUploadError(null)
    const form = new FormData()
    form.append('file', file)
    const res = await fetch('/api/application-drafts', { method: 'POST', body: form })
    const data = await res.json()
    if (!res.ok) {
      setUploadError(data.error ?? 'Upload failed.')
      setUploading(false)
      return
    }
    router.push(`/apply/draft/${data.draft_id}`)
  }

  async function handlePasteSubmit() {
    if (!pasteText.trim()) return
    setPasteLoading(true)
    setUploadError(null)
    const res = await fetch('/api/application-drafts', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ text: pasteText, name: pasteName.trim() || undefined }),
    })
    const data = await res.json()
    if (!res.ok) {
      setUploadError(data.error ?? 'Could not extract prompts.')
      setPasteLoading(false)
      return
    }
    router.push(`/apply/draft/${data.draft_id}`)
  }

  async function handleDelete(draftId: string) {
    await fetch(`/api/application-drafts/${draftId}`, { method: 'DELETE' })
    setDrafts((prev) => prev.filter((d) => d.id !== draftId))
  }

  const sortedDrafts = [...drafts].sort((a, b) => {
    if (sortKey === 'priority') {
      const diff = PRIORITY_ORDER[a.priority] - PRIORITY_ORDER[b.priority]
      if (diff !== 0) return diff
    }
    if (sortKey === 'deadline') {
      if (!a.deadline && !b.deadline) return 0
      if (!a.deadline) return 1
      if (!b.deadline) return -1
      return new Date(a.deadline).getTime() - new Date(b.deadline).getTime()
    }
    return new Date(b.created_at).getTime() - new Date(a.created_at).getTime()
  })

  const isSubmitting = uploading || pasteLoading

  return (
    <div className="mx-auto max-w-4xl px-4 py-8">
      <div className="mb-8">
        <h1 className="font-display text-2xl font-bold text-slate-50">Application Center</h1>
        <p className="mt-1 text-sm text-slate-500">
          Upload a document or paste text — the AI extracts prompts and helps you write your best application.
        </p>
      </div>

      {/* ── Input section ─────────────────────────────────────────────────── */}
      <div className="mb-8">
        {/* Tabs */}
        <div className="mb-4 flex gap-1 rounded-xl border border-navy-600 bg-navy-800 p-1 w-fit">
          {(['upload', 'paste'] as const).map((tab) => (
            <button
              key={tab}
              onClick={() => { setInputTab(tab); setUploadError(null) }}
              className={`rounded-lg px-4 py-2 text-sm font-medium transition-all ${
                inputTab === tab
                  ? 'bg-cyan-400 text-navy-950'
                  : 'text-slate-400 hover:text-slate-200'
              }`}
            >
              {tab === 'upload' ? (
                <span className="flex items-center gap-2">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" className="h-4 w-4">
                    <path strokeLinecap="round" strokeLinejoin="round" d="M3 16.5v2.25A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75V16.5m-13.5-9L12 3m0 0 4.5 4.5M12 3v13.5" />
                  </svg>
                  Upload File
                </span>
              ) : (
                <span className="flex items-center gap-2">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" className="h-4 w-4">
                    <path strokeLinecap="round" strokeLinejoin="round" d="M9 12h3.75M9 15h3.75M9 18h3.75m3 .75H18a2.25 2.25 0 0 0 2.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 0 0-1.123-.08m-5.801 0c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75 2.25 2.25 0 0 0-.1-.664m-5.8 0A2.251 2.251 0 0 1 13.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m0 0H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V9.375c0-.621-.504-1.125-1.125-1.125H8.25ZM6.75 12h.008v.008H6.75V12Zm0 3h.008v.008H6.75V15Zm0 3h.008v.008H6.75V18Z" />
                  </svg>
                  Paste Text
                </span>
              )}
            </button>
          ))}
        </div>

        {isSubmitting ? (
          <div className="rounded-2xl border border-navy-600 bg-navy-800 px-8 py-14 text-center">
            <div className="mx-auto mb-4 h-8 w-8 animate-spin rounded-full border-2 border-cyan-400 border-t-transparent" />
            <p className="text-sm text-slate-400">Extracting prompts from your application...</p>
          </div>
        ) : inputTab === 'upload' ? (
          <UploadZone onUpload={handleUpload} />
        ) : (
          <div className="rounded-2xl border border-navy-600 bg-navy-800 p-6 space-y-4">
            <div>
              <label className="mb-1.5 block text-xs font-semibold text-slate-400">Application name (optional)</label>
              <input
                type="text"
                value={pasteName}
                onChange={(e) => setPasteName(e.target.value)}
                placeholder="e.g. YMCA Youth Leadership Scholarship"
                className="w-full rounded-lg border border-navy-700 bg-navy-900 px-4 py-2.5 text-sm text-slate-100 placeholder-slate-600 outline-none transition-colors focus:border-cyan-400/50"
              />
            </div>
            <div>
              <label className="mb-1.5 block text-xs font-semibold text-slate-400">Paste your application text</label>
              <textarea
                value={pasteText}
                onChange={(e) => setPasteText(e.target.value)}
                placeholder="Paste the full text of your application, scholarship form, or essay prompts here..."
                rows={10}
                className="w-full resize-none rounded-lg border border-navy-700 bg-navy-900 px-4 py-3 text-sm text-slate-100 placeholder-slate-600 outline-none transition-colors focus:border-cyan-400/50"
              />
              <p className="mt-1 text-xs text-slate-600">{pasteText.length.toLocaleString()} / 40,000 characters</p>
            </div>
            <button
              onClick={handlePasteSubmit}
              disabled={!pasteText.trim() || pasteText.length > 40000}
              className="rounded-xl bg-cyan-400 px-6 py-2.5 text-sm font-semibold text-navy-950 transition-all hover:bg-cyan-300 disabled:opacity-40"
            >
              Extract Prompts
            </button>
          </div>
        )}

        {uploadError && (
          <p className="mt-3 text-sm text-rose-400">{uploadError}</p>
        )}
      </div>

      {/* ── Empty-state feature preview ───────────────────────────────────── */}
      {!loading && drafts.length === 0 && (
        <div className="mb-8">
          <p className="mb-4 text-xs font-semibold uppercase tracking-wider text-slate-600">
            What you&apos;ll get inside each application
          </p>

          <div className="grid gap-5 lg:grid-cols-[1fr_300px]">
            {/* Left: editor preview */}
            <div className="space-y-4">
              {/* Header card */}
              <div className="rounded-2xl border border-navy-600 bg-navy-800 p-5 opacity-60">
                <div className="flex flex-wrap items-start justify-between gap-4">
                  <div className="min-w-0 flex-1">
                    <p className="text-xs text-slate-600">← Application Center</p>
                    <p className="font-display mt-1 text-xl font-bold text-slate-400 italic">Application Name</p>
                    <div className="mt-3 flex flex-wrap items-center gap-3">
                      <div className="flex items-center gap-2">
                        <span className="text-xs text-slate-600">Priority:</span>
                        <span className="rounded-full border border-slate-600/30 bg-slate-600/10 px-2.5 py-0.5 text-xs font-semibold text-slate-500">None</span>
                      </div>
                      <div className="flex items-center gap-2">
                        <span className="text-xs text-slate-600">Deadline:</span>
                        <span className="text-xs text-slate-500">N/A</span>
                      </div>
                    </div>
                  </div>
                  <div className="flex shrink-0 gap-2">
                    <span className="flex items-center gap-2 rounded-lg border border-violet-400/20 bg-violet-400/5 px-4 py-2 text-xs font-semibold text-violet-500">
                      Quick Review
                    </span>
                    <span className="rounded-lg bg-slate-700 px-4 py-2 text-xs font-semibold text-slate-500">
                      Export PDF
                    </span>
                  </div>
                </div>
                <div className="mt-4 border-t border-navy-600 pt-4">
                  <div className="flex items-center justify-between mb-1.5">
                    <span className="text-xs text-slate-600">Application readiness</span>
                    <span className="text-xs font-bold text-slate-600">0%</span>
                  </div>
                  <div className="h-2 rounded-full bg-navy-700" />
                  <p className="mt-1 text-xs text-slate-700">0 of 0 prompts answered</p>
                </div>
              </div>

              {/* Prompt + answer preview */}
              <div className="rounded-xl border border-navy-600/50 bg-navy-800/50 p-5 opacity-50">
                <div className="mb-2 flex items-center gap-2">
                  <span className="rounded-full border border-slate-600/20 bg-slate-600/10 px-2.5 py-0.5 text-xs text-slate-600">essay</span>
                </div>
                <p className="text-sm text-slate-600 italic">Your application prompts will appear here — one at a time.</p>
              </div>

              <div className="rounded-xl border border-navy-600/50 bg-navy-800/50 p-4 opacity-50">
                <div className="h-28 rounded-lg border border-navy-700 bg-navy-900 px-4 py-3 text-sm text-slate-700 italic">
                  Upload or paste an application above to start writing...
                </div>
              </div>

              {/* AI assist button previews */}
              <div className="flex gap-3 opacity-40">
                <span className="flex items-center gap-2 rounded-lg border border-cyan-400/20 bg-cyan-400/5 px-4 py-2.5 text-sm font-medium text-cyan-600">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" className="h-4 w-4">
                    <path strokeLinecap="round" strokeLinejoin="round" d="M12 18v-5.25m0 0a6.01 6.01 0 0 0 1.5-.189m-1.5.189a6.01 6.01 0 0 1-1.5-.189m3.75 7.478a12.06 12.06 0 0 1-4.5 0m3.75 2.383a14.406 14.406 0 0 1-3 0M14.25 18v-.192c0-.983.658-1.823 1.508-2.316a7.5 7.5 0 1 0-7.517 0c.85.493 1.509 1.333 1.509 2.316V18" />
                  </svg>
                  Brainstorm angles
                </span>
                <span className="flex items-center gap-2 rounded-lg border border-navy-600 bg-navy-800 px-4 py-2.5 text-sm font-medium text-slate-600">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" className="h-4 w-4">
                    <path strokeLinecap="round" strokeLinejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10" />
                  </svg>
                  Draft a response
                </span>
              </div>
            </div>

            {/* Right: sidebar preview */}
            <div className="hidden lg:block">
              <div className="rounded-xl border border-navy-600/50 bg-navy-800/50 overflow-hidden opacity-60">
                {/* Tabs */}
                <div className="flex border-b border-navy-600">
                  {['Prompts', 'Write Assist', 'Notes'].map((label, i) => (
                    <div key={label} className={`flex-1 py-2.5 text-center text-xs font-medium ${i === 0 ? 'border-b-2 border-cyan-400/40 text-cyan-600' : 'text-slate-600'}`}>
                      {label}
                    </div>
                  ))}
                </div>

                {/* Prompts preview */}
                <div className="p-4 space-y-2">
                  {[1, 2, 3].map((n) => (
                    <div key={n} className="flex items-center gap-2.5 rounded-lg px-3 py-2">
                      <span className="flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-navy-700 text-[10px] font-bold text-slate-600">{n}</span>
                      <span className="h-2.5 flex-1 rounded bg-navy-700" />
                    </div>
                  ))}
                  <p className="pt-2 text-center text-xs text-slate-700 italic">Upload above to see your prompts here</p>
                </div>

                {/* Write Assist tab preview */}
                <div className="border-t border-navy-600 p-4">
                  <p className="text-xs font-semibold text-slate-500 mb-1">Write Assist</p>
                  <p className="text-xs text-slate-700">A writing coach that reviews your answers, suggests improvements, and helps you sound your best — available once you add an application.</p>
                </div>

                {/* Notes tab preview */}
                <div className="border-t border-navy-600 p-4">
                  <p className="text-xs font-semibold text-slate-500 mb-1">Notes</p>
                  <p className="text-xs text-slate-700">Free-form scratchpad for each application — jot ideas, reminders, and key experiences to mention.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* ── Draft list ─────────────────────────────────────────────────────── */}
      {loading ? (
        <p className="text-sm text-slate-500">Loading drafts...</p>
      ) : drafts.length > 0 && (
        <section>
          <div className="mb-4 flex items-center justify-between gap-4">
            <h2 className="font-display text-sm font-semibold uppercase tracking-wider text-slate-500">
              Your Applications
            </h2>
            {/* Sort controls */}
            <div className="flex gap-1 rounded-lg border border-navy-600 bg-navy-800 p-0.5">
              {(['date', 'priority', 'deadline'] as const).map((key) => (
                <button
                  key={key}
                  onClick={() => setSortKey(key)}
                  className={`rounded-md px-3 py-1 text-xs font-medium transition-all capitalize ${
                    sortKey === key
                      ? 'bg-navy-700 text-slate-200'
                      : 'text-slate-500 hover:text-slate-300'
                  }`}
                >
                  {key}
                </button>
              ))}
            </div>
          </div>

          <div className="space-y-3">
            {sortedDrafts.map((draft) => {
              const total = draft.application_prompts.length
              const answered = draft.application_prompts.filter((p) => p.answer?.trim()).length
              const displayName = draft.name || draft.document_name
              return (
                <div
                  key={draft.id}
                  className="flex items-center gap-4 rounded-xl border border-navy-600 bg-navy-800 px-5 py-4 transition-all hover:border-cyan-400/30"
                >
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2 flex-wrap">
                      <p className="font-medium text-slate-100 truncate">{displayName}</p>
                      {draft.priority !== 'none' && (
                        <span className={`inline-flex items-center rounded-full border px-2 py-0.5 text-[10px] font-semibold capitalize ${PRIORITY_STYLES[draft.priority]}`}>
                          {draft.priority}
                        </span>
                      )}
                    </div>
                    {draft.opportunities && (
                      <p className="text-xs text-slate-500 mt-0.5">{draft.opportunities.title} — {draft.opportunities.organization}</p>
                    )}
                    <div className="mt-2 flex items-center gap-4">
                      <div className="max-w-[180px] flex-1">
                        <ProgressBar answered={answered} total={total} />
                      </div>
                      <DeadlineBadge deadline={draft.deadline} />
                    </div>
                  </div>
                  <div className="flex items-center gap-3 shrink-0">
                    <span className="text-xs text-slate-600">
                      {new Date(draft.created_at).toLocaleDateString()}
                    </span>
                    <Link
                      href={`/apply/draft/${draft.id}`}
                      className="rounded-lg bg-cyan-400 px-4 py-2 text-xs font-semibold text-navy-950 transition-all hover:bg-cyan-300"
                    >
                      {answered === total && total > 0 ? 'Review' : 'Continue'}
                    </Link>
                    <button
                      onClick={() => handleDelete(draft.id)}
                      className="text-slate-600 hover:text-rose-400 transition-colors"
                      title="Delete draft"
                    >
                      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="h-4 w-4">
                        <path strokeLinecap="round" strokeLinejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
                      </svg>
                    </button>
                  </div>
                </div>
              )
            })}
          </div>
        </section>
      )}
    </div>
  )
}
