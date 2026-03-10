import { NextResponse } from 'next/server'
import { createSupabaseServerClient, createSupabaseServiceClient } from '@/lib/supabase-server'

export async function POST(
  _request: Request,
  { params }: { params: Promise<{ id: string }> }
) {
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return NextResponse.json({ error: 'Authentication required.' }, { status: 401 })

  const { id } = await params
  const service = createSupabaseServiceClient()

  const { error } = await service
    .from('notifications')
    .update({ read_at: new Date().toISOString(), status: 'read' })
    .eq('id', id)
    .eq('user_id', user.id) // Ensure user can only mark their own notifications

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  return NextResponse.json({ success: true })
}
