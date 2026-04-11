import { redirect } from 'next/navigation'
import { createSupabaseServerClient } from '@/lib/supabase-server'
import { ChatPanel } from '@/components/ChatPanel'

export default async function AiGuidancePage() {
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  return (
    <div className="mx-auto max-w-4xl px-4 py-8">
      <div className="mb-6">
        <h1 className="font-display text-2xl font-bold text-slate-50">AI Guidance</h1>
        <p className="mt-1 text-sm text-slate-500">
          Get personalized opportunity recommendations based on your goals, skills, and interests.
        </p>
      </div>
      <ChatPanel />
    </div>
  )
}
