-- Migration 112: Chat sessions for AI counseling chatbot
-- Stores conversation history per user, including flagged injection attempts

CREATE TABLE IF NOT EXISTS chat_sessions (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id       UUID NOT NULL REFERENCES user_profiles(id) ON DELETE CASCADE,
  role          TEXT NOT NULL CHECK (role IN ('user', 'assistant')),
  content       TEXT NOT NULL,
  flagged       BOOLEAN NOT NULL DEFAULT false,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_chat_sessions_user_id ON chat_sessions(user_id);
CREATE INDEX idx_chat_sessions_created_at ON chat_sessions(user_id, created_at DESC);

-- RLS: users can only read their own messages
ALTER TABLE chat_sessions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own chat messages"
  ON chat_sessions FOR SELECT
  USING (user_id = auth.uid());

-- Service role used for INSERT/UPDATE from API routes (bypasses RLS)

COMMENT ON TABLE chat_sessions IS
  'Stores AI counseling chatbot conversation history. Flagged rows contain detected injection attempts for review.';
