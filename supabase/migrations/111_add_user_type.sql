-- Migration 111: Add user_type to user_profiles
-- Supports three user types: high_school_student, civic_nonprofit, general
-- All existing accounts default to high_school_student

ALTER TABLE user_profiles
  ADD COLUMN IF NOT EXISTS user_type TEXT NOT NULL DEFAULT 'high_school_student'
  CHECK (user_type IN ('high_school_student', 'civic_nonprofit', 'general'));

-- Label all existing accounts as high school students (they were all test accounts)
UPDATE user_profiles
  SET user_type = 'high_school_student'
  WHERE user_type = 'high_school_student'; -- no-op but explicit intent

COMMENT ON COLUMN user_profiles.user_type IS
  'User persona: high_school_student | civic_nonprofit | general. Chosen at signup, controls dashboard layout.';
