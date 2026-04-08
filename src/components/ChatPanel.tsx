'use client'

import { useState, useEffect, useRef } from 'react'

interface Message {
  id: string
  role: 'user' | 'assistant'
  content: string
  created_at?: string
}

const GREETING: Message = {
  id: 'greeting',
  role: 'assistant',
  content: "Hi! I'm your Opportography AI assistant. I'm here to help you find real local opportunities — scholarships, internships, trade programs, mentorships, and more — matched to your goals and background.\n\nWhat are you looking for, or what's on your mind for your future?",
}

export function ChatPanel() {
  const [messages, setMessages] = useState<Message[]>([GREETING])
  const [input, setInput] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [remaining, setRemaining] = useState<number | null>(null)
  const [historyLoaded, setHistoryLoaded] = useState(false)
  const bottomRef = useRef<HTMLDivElement>(null)
  const inputRef = useRef<HTMLTextAreaElement>(null)

  // Load conversation history on mount
  useEffect(() => {
    fetch('/api/chat')
      .then(r => r.json())
      .then(({ messages: history }) => {
        if (history?.length > 0) {
          setMessages([
            GREETING,
            ...history.map((m: { id: string; role: 'user' | 'assistant'; content: string; created_at: string }) => ({
              id: m.id,
              role: m.role,
              content: m.content,
              created_at: m.created_at,
            })),
          ])
        }
        setHistoryLoaded(true)
      })
      .catch(() => setHistoryLoaded(true))
  }, [])

  // Scroll to bottom when messages change
  useEffect(() => {
    bottomRef.current?.scrollIntoView({ behavior: 'smooth' })
  }, [messages, loading])

  async function handleSend() {
    const text = input.trim()
    if (!text || loading) return

    const userMsg: Message = { id: Date.now().toString(), role: 'user', content: text }
    setMessages(prev => [...prev, userMsg])
    setInput('')
    setLoading(true)
    setError(null)

    try {
      const res = await fetch('/api/chat', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ message: text }),
      })

      const data = await res.json()

      if (res.status === 429) {
        setError(data.error)
        setLoading(false)
        return
      }

      if (!res.ok) {
        setError(data.error ?? 'Something went wrong.')
        setLoading(false)
        return
      }

      const assistantMsg: Message = {
        id: (Date.now() + 1).toString(),
        role: 'assistant',
        content: data.reply,
      }
      setMessages(prev => [...prev, assistantMsg])
      if (typeof data.remaining === 'number') setRemaining(data.remaining)
    } catch {
      setError('Network error. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  function handleKeyDown(e: React.KeyboardEvent) {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault()
      handleSend()
    }
  }

  async function handleClear() {
    await fetch('/api/chat', { method: 'DELETE' })
    setMessages([GREETING])
  }

  return (
    <div
      className="flex flex-col rounded-2xl border overflow-hidden"
      style={{
        background: 'rgba(10,14,26,0.95)',
        borderColor: 'rgba(34,211,238,0.18)',
        height: 'clamp(500px, 70vh, 700px)',
      }}
    >
      {/* Header */}
      <div className="flex items-center justify-between border-b px-5 py-3" style={{ borderColor: 'rgba(34,211,238,0.12)' }}>
        <div className="flex items-center gap-2.5">
          {/* Logo dot */}
          <div className="flex h-7 w-7 items-center justify-center rounded-full bg-cyan-400/10 border border-cyan-400/30">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" className="h-4 w-4 text-cyan-400">
              <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7z" />
              <circle cx="12" cy="9" r="2.5" />
            </svg>
          </div>
          <span className="text-sm font-semibold text-white">Opportography AI</span>
          {/* Security badge */}
          <div className="flex items-center gap-1 rounded-full border border-cyan-400/20 bg-cyan-400/5 px-2 py-0.5" title="This assistant only discusses opportunities and is protected against misuse.">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="h-3 w-3 text-cyan-400">
              <rect x="3" y="11" width="18" height="11" rx="2" ry="2" />
              <path d="M7 11V7a5 5 0 0 1 10 0v4" />
            </svg>
            <span className="text-[10px] font-medium text-cyan-400">Focused & Secure</span>
          </div>
        </div>
        <button
          onClick={handleClear}
          className="text-[11px] text-slate-600 hover:text-slate-400 transition-colors"
        >
          Clear history
        </button>
      </div>

      {/* Messages */}
      <div className="flex-1 overflow-y-auto px-5 py-4 space-y-4">
        {!historyLoaded && (
          <div className="flex justify-center py-8">
            <span className="text-xs text-slate-600">Loading conversation...</span>
          </div>
        )}
        {messages.map((msg) => (
          <div key={msg.id} className={`flex gap-3 ${msg.role === 'user' ? 'flex-row-reverse' : 'flex-row'}`}>
            {/* Avatar */}
            {msg.role === 'assistant' && (
              <div className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full bg-cyan-400/10 border border-cyan-400/20 mt-0.5">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" className="h-3.5 w-3.5 text-cyan-400">
                  <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7z" />
                  <circle cx="12" cy="9" r="2.5" />
                </svg>
              </div>
            )}
            {/* Bubble */}
            <div
              className="max-w-[78%] rounded-2xl px-4 py-3 text-sm leading-relaxed"
              style={{
                background: msg.role === 'assistant'
                  ? 'rgba(20,28,53,0.90)'
                  : 'rgba(34,211,238,0.12)',
                borderRadius: msg.role === 'assistant'
                  ? '4px 18px 18px 18px'
                  : '18px 4px 18px 18px',
                color: '#f1f5f9',
                border: msg.role === 'assistant'
                  ? '1px solid rgba(34,211,238,0.12)'
                  : '1px solid rgba(34,211,238,0.25)',
              }}
            >
              {/* Render line breaks and basic markdown */}
              {msg.content.split('\n').map((line, i) => (
                <p key={i} className={line === '' ? 'mt-2' : ''}>
                  {line.startsWith('**') && line.endsWith('**')
                    ? <strong>{line.slice(2, -2)}</strong>
                    : line}
                </p>
              ))}
            </div>
          </div>
        ))}

        {/* Typing indicator */}
        {loading && (
          <div className="flex gap-3">
            <div className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full bg-cyan-400/10 border border-cyan-400/20">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" className="h-3.5 w-3.5 text-cyan-400">
                <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7z" />
                <circle cx="12" cy="9" r="2.5" />
              </svg>
            </div>
            <div className="flex items-center gap-1.5 rounded-2xl px-4 py-3" style={{ background: 'rgba(20,28,53,0.90)', border: '1px solid rgba(34,211,238,0.12)', borderRadius: '4px 18px 18px 18px' }}>
              <span className="h-1.5 w-1.5 rounded-full bg-cyan-400 animate-bounce" style={{ animationDelay: '0ms' }} />
              <span className="h-1.5 w-1.5 rounded-full bg-cyan-400 animate-bounce" style={{ animationDelay: '150ms' }} />
              <span className="h-1.5 w-1.5 rounded-full bg-cyan-400 animate-bounce" style={{ animationDelay: '300ms' }} />
            </div>
          </div>
        )}

        {error && (
          <p className="text-xs text-rose-400 text-center">{error}</p>
        )}

        <div ref={bottomRef} />
      </div>

      {/* Input bar */}
      <div className="border-t px-4 py-3" style={{ borderColor: 'rgba(34,211,238,0.12)' }}>
        {remaining !== null && remaining <= 5 && (
          <p className="mb-2 text-[10px] text-slate-600 text-center">{remaining} messages remaining this hour</p>
        )}
        <div className="flex items-end gap-3">
          <textarea
            ref={inputRef}
            value={input}
            onChange={e => setInput(e.target.value)}
            onKeyDown={handleKeyDown}
            placeholder="Ask about scholarships, internships, trade programs..."
            rows={1}
            className="flex-1 resize-none rounded-xl border px-4 py-3 text-sm text-white placeholder-slate-600 outline-none transition-colors focus:border-cyan-400/50"
            style={{
              background: 'rgba(14,22,50,0.80)',
              borderColor: 'rgba(45,64,112,0.6)',
              maxHeight: '120px',
              overflowY: 'auto',
            }}
            onInput={e => {
              const t = e.target as HTMLTextAreaElement
              t.style.height = 'auto'
              t.style.height = t.scrollHeight + 'px'
            }}
          />
          <button
            onClick={handleSend}
            disabled={loading || !input.trim()}
            className="flex h-11 w-11 shrink-0 items-center justify-center rounded-xl bg-cyan-400 text-navy-950 transition-all hover:bg-cyan-300 disabled:opacity-40"
          >
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="h-4 w-4">
              <path d="M22 2L11 13" />
              <path d="M22 2L15 22 11 13 2 9l20-7z" />
            </svg>
          </button>
        </div>
        <p className="mt-2 text-[10px] text-slate-700 text-center">Press Enter to send · Shift+Enter for new line</p>
      </div>
    </div>
  )
}
