'use client'

import { useState, useRef, useEffect, useCallback } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'

interface Draft {
  id: string
  document_name: string
  created_at: string
  opportunities: { id: string; title: string; organization: string } | null
  application_prompts: { id: string; answer: string | null }[]
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
      className="cursor-pointer rounded-2xl border-2 border-dashed px-8 py-14 text-center transition-all"
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

function ProgressRing({ answered, total }: { answered: number; total: number }) {
  const pct = total === 0 ? 0 : Math.round((answered / total) * 100)
  return (
    <div className="flex items-center gap-2">
      <div className="h-2 flex-1 rounded-full bg-navy-700">
        <div
          className="h-2 rounded-full bg-cyan-400 transition-all"
          style={{ width: `${pct}%` }}
        />
      </div>
      <span className="text-xs text-slate-500">{answered}/{total}</span>
    </div>
  )
}

export default function ApplyPage() {
  const [drafts, setDrafts] = useState<Draft[]>([])
  const [loading, setLoading] = useState(true)
  const [uploading, setUploading] = useState(false)
  const [uploadError, setUploadError] = useState<string | null>(null)
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

  async function handleDelete(draftId: string) {
    await fetch(`/api/application-drafts/${draftId}`, { method: 'DELETE' })
    setDrafts((prev) => prev.filter((d) => d.id !== draftId))
  }

  return (
    <div className="mx-auto max-w-4xl px-4 py-8">
      <div className="mb-8">
        <h1 className="font-display text-2xl font-bold text-slate-50">Application Center</h1>
        <p className="mt-1 text-sm text-slate-500">
          Upload an application document — the AI will extract the prompts and help you draft your responses.
        </p>
      </div>

      {/* Upload zone */}
      <div className="mb-8">
        {uploading ? (
          <div className="rounded-2xl border border-navy-600 bg-navy-800 px-8 py-14 text-center">
            <div className="mx-auto mb-4 h-8 w-8 animate-spin rounded-full border-2 border-cyan-400 border-t-transparent" />
            <p className="text-sm text-slate-400">Reading your document and extracting prompts...</p>
          </div>
        ) : (
          <UploadZone onUpload={handleUpload} />
        )}
        {uploadError && (
          <p className="mt-3 text-sm text-rose-400">{uploadError}</p>
        )}
      </div>

      {/* Existing drafts */}
      {loading ? (
        <p className="text-sm text-slate-500">Loading drafts...</p>
      ) : drafts.length > 0 && (
        <section>
          <h2 className="font-display mb-4 text-sm font-semibold uppercase tracking-wider text-slate-500">
            Your Drafts
          </h2>
          <div className="space-y-3">
            {drafts.map((draft) => {
              const total = draft.application_prompts.length
              const answered = draft.application_prompts.filter((p) => p.answer?.trim()).length
              return (
                <div
                  key={draft.id}
                  className="flex items-center gap-4 rounded-xl border border-navy-600 bg-navy-800 px-5 py-4 transition-all hover:border-cyan-400/30"
                >
                  <div className="flex-1 min-w-0">
                    <p className="font-medium text-slate-100 truncate">{draft.document_name}</p>
                    {draft.opportunities && (
                      <p className="text-xs text-slate-500 mt-0.5">{draft.opportunities.title} — {draft.opportunities.organization}</p>
                    )}
                    <div className="mt-2 max-w-xs">
                      <ProgressRing answered={answered} total={total} />
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
