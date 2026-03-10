'use client'

import { createContext, useContext, useState, useEffect, useCallback, ReactNode } from 'react'
import { createSupabaseBrowserClient } from '@/lib/supabase-browser'

interface SaveMetadata {
  match_score?: number
  match_reasoning?: string
}

interface SavedContextType {
  savedIds: string[]
  isAuthenticated: boolean
  toggleSave: (id: string, metadata?: SaveMetadata) => void
  isSaved: (id: string) => boolean
}

const SavedContext = createContext<SavedContextType>({
  savedIds: [],
  isAuthenticated: false,
  toggleSave: () => {},
  isSaved: () => false,
})

const STORAGE_KEY = 'opportography-saved'

export function SavedProvider({ children }: { children: ReactNode }) {
  const [savedIds, setSavedIds] = useState<string[]>([])
  const [loaded, setLoaded] = useState(false)
  const [isAuthenticated, setIsAuthenticated] = useState(false)
  const supabase = createSupabaseBrowserClient()

  useEffect(() => {
    async function init() {
      const { data: { user } } = await supabase.auth.getUser()

      if (user) {
        setIsAuthenticated(true)
        // Fetch DB saved list
        const res = await fetch('/api/saved')
        if (res.ok) {
          const { saved } = await res.json()
          const dbIds: string[] = (saved ?? []).map(
            (s: { opportunity_id: string }) => s.opportunity_id
          )

          // Merge any localStorage saves into DB
          const localStored = localStorage.getItem(STORAGE_KEY)
          if (localStored) {
            try {
              const localIds: string[] = JSON.parse(localStored)
              const toMerge = localIds.filter((id) => !dbIds.includes(id))
              for (const id of toMerge) {
                await fetch('/api/saved', {
                  method: 'POST',
                  headers: { 'Content-Type': 'application/json' },
                  body: JSON.stringify({ opportunity_id: id }),
                })
              }
              localStorage.removeItem(STORAGE_KEY)
              setSavedIds([...new Set([...dbIds, ...toMerge])])
            } catch {
              setSavedIds(dbIds)
            }
          } else {
            setSavedIds(dbIds)
          }
        }
      } else {
        // Anonymous: use localStorage
        const stored = localStorage.getItem(STORAGE_KEY)
        if (stored) {
          try {
            setSavedIds(JSON.parse(stored))
          } catch {
            setSavedIds([])
          }
        }
      }
      setLoaded(true)
    }

    init()

    // Update auth state on change
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setIsAuthenticated(!!session?.user)
    })

    return () => subscription.unsubscribe()
  }, [supabase])

  // Persist to localStorage only for anonymous users
  useEffect(() => {
    if (loaded && !isAuthenticated) {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(savedIds))
    }
  }, [savedIds, loaded, isAuthenticated])

  const toggleSave = useCallback(
    async (id: string, metadata?: SaveMetadata) => {
      const alreadySaved = savedIds.includes(id)

      // Optimistic update
      setSavedIds((prev) => (alreadySaved ? prev.filter((s) => s !== id) : [...prev, id]))

      if (isAuthenticated) {
        if (alreadySaved) {
          await fetch(`/api/saved?opportunity_id=${id}`, { method: 'DELETE' })
        } else {
          await fetch('/api/saved', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
              opportunity_id: id,
              match_score: metadata?.match_score ?? null,
              match_reasoning: metadata?.match_reasoning ?? null,
            }),
          })
        }
      }
    },
    [savedIds, isAuthenticated]
  )

  const isSaved = useCallback((id: string) => savedIds.includes(id), [savedIds])

  return (
    <SavedContext.Provider value={{ savedIds, isAuthenticated, toggleSave, isSaved }}>
      {children}
    </SavedContext.Provider>
  )
}

export function useSaved() {
  return useContext(SavedContext)
}
