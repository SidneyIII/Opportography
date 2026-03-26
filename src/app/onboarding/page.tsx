'use client'

import { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'

type Step = 1 | 2 | 3 | 4 | 5 | 6
const TOTAL_STEPS = 6

const AGE_RANGES = ['Under 18', '18-24', '25-34', '35-44', '45-54', '55+']
const STATUSES = [
  { value: 'working', label: 'Working' },
  { value: 'in_school', label: 'In School' },
  { value: 'looking_for_work', label: 'Looking for Work' },
  { value: 'between_jobs', label: 'Between Jobs' },
  { value: 'caring_for_family', label: 'Caring for Family' },
]
const EDUCATION_LEVELS = [
  'No diploma/GED',
  'GED',
  'High school diploma',
  'Some college',
  "Associate's degree",
  "Bachelor's degree",
  'Graduate degree',
  'Trade certification',
]
const HOUSEHOLD_TYPES = [
  'Single, no kids',
  'Single parent',
  'Partnered, no kids',
  'Partnered with kids',
  'Living with family',
  'Prefer not to say',
]
const INTERESTS = [
  { value: 'jobs_employment', label: 'Jobs & Employment' },
  { value: 'education_training', label: 'Education & Training' },
  { value: 'scholarships', label: 'Scholarships & Financial Aid' },
  { value: 'legal_help', label: 'Legal Help' },
  { value: 'health_wellness', label: 'Health & Wellness' },
  { value: 'financial_literacy', label: 'Financial Literacy & Money Help' },
  { value: 'childcare_family', label: 'Childcare & Family Support' },
  { value: 'housing', label: 'Housing' },
  { value: 'networking', label: 'Networking & Professional Growth' },
  { value: 'volunteering', label: 'Volunteering' },
  { value: 'business', label: 'Starting a Business' },
  { value: 'technology', label: 'Technology & AI Skills' },
  { value: 'civic_engagement', label: 'Civic Engagement' },
  { value: 'community_cultural', label: 'Community & Cultural Programs' },
]
const LANGUAGES = ['English', 'Spanish', 'Arabic', 'Karen', 'Vietnamese', 'Somali', 'French']
const COMMUNITIES = [
  { value: 'native_american', label: 'Native American / Indigenous' },
  { value: 'lgbtq', label: 'LGBTQ+' },
  { value: 'immigrant', label: 'Immigrant or Refugee' },
  { value: 'veteran', label: 'Veteran or Military Family' },
  { value: 'disabled', label: 'Person with a Disability' },
  { value: 'foster_youth', label: 'Former Foster Youth' },
  { value: 'justice_involved', label: 'Formerly Incarcerated / Justice-Involved' },
]

export default function OnboardingPage() {
  const router = useRouter()
  const [step, setStep] = useState<Step>(1)
  const [saving, setSaving] = useState(false)

  // Step 1 - Basics
  const [city, setCity] = useState('')
  const [stateField, setStateField] = useState('')
  const [ageRange, setAgeRange] = useState('')
  const [zip, setZip] = useState('')

  // Step 2 - Situation
  const [currentStatus, setCurrentStatus] = useState<string[]>([])
  const [education, setEducation] = useState('')
  const [household, setHousehold] = useState('')

  // Step 3 - Interests
  const [interests, setInterests] = useState<string[]>([])

  // Step 4 - Languages
  const [languages, setLanguages] = useState<string[]>(['English'])
  const [otherLanguage, setOtherLanguage] = useState('')

  // Step 5 - Community
  const [communities, setCommunities] = useState<string[]>([])

  // Step 6 - Goals
  const [goals, setGoals] = useState('')

  // Pre-populate from saved profile on mount
  useEffect(() => {
    fetch('/api/profile')
      .then((r) => (r.ok ? r.json() : null))
      .then((data) => {
        if (!data?.profile) return
        const p = data.profile

        // City
        if (p.city) setCity(p.city)
        if (p.state) setStateField(p.state)

        // Age range — reverse the lowercase+underscore transform
        if (p.age_range) {
          const match = AGE_RANGES.find(
            (a) => a.toLowerCase().replace(/ /g, '_').replace('+', '') === p.age_range
          )
          if (match) setAgeRange(match)
        }

        // ZIP
        if (p.zip_code) setZip(p.zip_code)

        // Situation
        if (p.current_status?.length) setCurrentStatus(p.current_status)
        if (p.education_level) setEducation(p.education_level)
        if (p.household_type) {
          const match = HOUSEHOLD_TYPES.find(
            (h) => h.toLowerCase().replace(/[ ,]/g, '_') === p.household_type
          )
          if (match) setHousehold(match)
        }

        // Interests
        if (p.interest_categories?.length) setInterests(p.interest_categories)

        // Languages — LANGUAGES list is Title Case; stored lowercase
        if (p.languages?.length) {
          const knownLower = LANGUAGES.map((l) => l.toLowerCase())
          const matched = LANGUAGES.filter((l) => p.languages.includes(l.toLowerCase()))
          const other = (p.languages as string[]).filter((l) => !knownLower.includes(l))
          setLanguages(matched.length > 0 ? matched : ['English'])
          if (other.length > 0) setOtherLanguage(other[0])
        }

        // Goals (community_identities is intentionally omitted — sensitive field not returned by API)
        if (p.goals_freetext) setGoals(p.goals_freetext)
      })
      .catch(() => {
        // Silently ignore — new user with no profile yet
      })
  }, [])

  function toggleArray(arr: string[], val: string, setter: (v: string[]) => void) {
    setter(arr.includes(val) ? arr.filter((x) => x !== val) : [...arr, val])
  }

  async function handleFinish() {
    setSaving(true)
    const allLanguages = [
      ...languages.map((l) => l.toLowerCase()),
      ...(otherLanguage ? [otherLanguage.toLowerCase()] : []),
    ]

    await fetch('/api/profile', {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        age_range: ageRange ? ageRange.toLowerCase().replace(/ /g, '_').replace('+', '') : null,
        city: city || null,
        state: stateField || null,
        zip_code: zip || null,
        current_status: currentStatus,
        education_level: education || null,
        household_type: household ? household.toLowerCase().replace(/[ ,]/g, '_') : null,
        interest_categories: interests,
        languages: allLanguages,
        community_identities: communities,
        goals_freetext: goals || null,
      }),
    })

    router.push('/dashboard')
  }

  const progress = ((step - 1) / (TOTAL_STEPS - 1)) * 100

  return (
    <div className="mx-auto max-w-2xl px-4 py-10">
      {/* Progress bar */}
      <div className="mb-8">
        <div className="mb-2 flex justify-between text-xs text-slate-500">
          <span>Step {step} of {TOTAL_STEPS}</span>
          <span>{Math.round(progress)}% complete</span>
        </div>
        <div className="h-1.5 overflow-hidden rounded-full bg-navy-700">
          <div
            className="h-full rounded-full bg-cyan-400 transition-all duration-500"
            style={{ width: `${progress}%` }}
          />
        </div>
      </div>

      <div className="rounded-xl border border-navy-600 bg-navy-800 p-8">
        {/* ── Step 1: Basics ── */}
        {step === 1 && (
          <div>
            <h2 className="font-display mb-1 text-2xl font-bold text-slate-50">
              Let&apos;s start with a few basics.
            </h2>
            <p className="mb-6 text-slate-400">This helps us find opportunities near you.</p>

            <div className="space-y-6">
              <div className="flex gap-4">
                <div className="flex-1">
                  <label className="mb-1.5 block text-sm font-medium text-slate-300">
                    City
                  </label>
                  <input
                    type="text"
                    value={city}
                    onChange={(e) => setCity(e.target.value)}
                    placeholder="e.g. Omaha"
                    className="w-full rounded-lg border border-navy-600 bg-navy-900 px-4 py-3 text-slate-100 placeholder-slate-500 focus:border-cyan-400 focus:outline-none"
                  />
                </div>
                <div className="w-28">
                  <label className="mb-1.5 block text-sm font-medium text-slate-300">
                    State
                  </label>
                  <input
                    type="text"
                    value={stateField}
                    onChange={(e) => setStateField(e.target.value.toUpperCase().substring(0, 2))}
                    placeholder="NE"
                    className="w-full rounded-lg border border-navy-600 bg-navy-900 px-4 py-3 text-slate-100 placeholder-slate-500 focus:border-cyan-400 focus:outline-none"
                  />
                </div>
              </div>

              <div>
                <label className="mb-3 block text-sm font-medium text-slate-300">Age range</label>
                <div className="flex flex-wrap gap-2">
                  {AGE_RANGES.map((a) => (
                    <button
                      key={a}
                      type="button"
                      onClick={() => setAgeRange(a)}
                      className={`rounded-full px-4 py-2 text-sm font-medium transition-all ${
                        ageRange === a
                          ? 'bg-cyan-400 text-navy-950'
                          : 'border border-navy-600 text-slate-400 hover:border-cyan-400/50 hover:text-cyan-400'
                      }`}
                    >
                      {a}
                    </button>
                  ))}
                </div>
              </div>

              <div>
                <label className="mb-1.5 block text-sm font-medium text-slate-300">
                  ZIP code <span className="text-slate-500">(optional)</span>
                </label>
                <input
                  type="text"
                  value={zip}
                  onChange={(e) => setZip(e.target.value.replace(/\D/g, '').substring(0, 5))}
                  placeholder="e.g. 68104"
                  className="w-48 rounded-lg border border-navy-600 bg-navy-900 px-4 py-3 text-slate-100 placeholder-slate-500 focus:border-cyan-400 focus:outline-none"
                />
              </div>
            </div>
          </div>
        )}

        {/* ── Step 2: Situation ── */}
        {step === 2 && (
          <div>
            <h2 className="font-display mb-1 text-2xl font-bold text-slate-50">
              Tell us about where you are right now.
            </h2>
            <p className="mb-6 text-slate-400">Select all that apply.</p>

            <div className="space-y-6">
              <div>
                <label className="mb-3 block text-sm font-medium text-slate-300">
                  Current situation
                </label>
                <div className="flex flex-wrap gap-2">
                  {STATUSES.map((s) => (
                    <button
                      key={s.value}
                      type="button"
                      onClick={() => toggleArray(currentStatus, s.value, setCurrentStatus)}
                      className={`rounded-full px-4 py-2 text-sm font-medium transition-all ${
                        currentStatus.includes(s.value)
                          ? 'bg-cyan-400 text-navy-950'
                          : 'border border-navy-600 text-slate-400 hover:border-cyan-400/50 hover:text-cyan-400'
                      }`}
                    >
                      {s.label}
                    </button>
                  ))}
                </div>
              </div>

              <div>
                <label className="mb-3 block text-sm font-medium text-slate-300">
                  Education level
                </label>
                <div className="flex flex-wrap gap-2">
                  {EDUCATION_LEVELS.map((e) => (
                    <button
                      key={e}
                      type="button"
                      onClick={() => setEducation(e)}
                      className={`rounded-full px-4 py-2 text-sm font-medium transition-all ${
                        education === e
                          ? 'bg-cyan-400 text-navy-950'
                          : 'border border-navy-600 text-slate-400 hover:border-cyan-400/50 hover:text-cyan-400'
                      }`}
                    >
                      {e}
                    </button>
                  ))}
                </div>
              </div>

              <div>
                <label className="mb-3 block text-sm font-medium text-slate-300">Household</label>
                <div className="flex flex-wrap gap-2">
                  {HOUSEHOLD_TYPES.map((h) => (
                    <button
                      key={h}
                      type="button"
                      onClick={() => setHousehold(h)}
                      className={`rounded-full px-4 py-2 text-sm font-medium transition-all ${
                        household === h
                          ? 'bg-cyan-400 text-navy-950'
                          : 'border border-navy-600 text-slate-400 hover:border-cyan-400/50 hover:text-cyan-400'
                      }`}
                    >
                      {h}
                    </button>
                  ))}
                </div>
              </div>
            </div>
          </div>
        )}

        {/* ── Step 3: Interests ── */}
        {step === 3 && (
          <div>
            <h2 className="font-display mb-1 text-2xl font-bold text-slate-50">
              What kinds of opportunities interest you?
            </h2>
            <p className="mb-6 text-slate-400">Pick all that apply.</p>

            <div className="grid gap-2 sm:grid-cols-2">
              {INTERESTS.map((i) => (
                <button
                  key={i.value}
                  type="button"
                  onClick={() => toggleArray(interests, i.value, setInterests)}
                  className={`flex items-center gap-3 rounded-lg px-4 py-3 text-left text-sm transition-all ${
                    interests.includes(i.value)
                      ? 'bg-cyan-400/15 border border-cyan-400/50 text-cyan-400'
                      : 'border border-navy-600 text-slate-400 hover:border-navy-500 hover:text-slate-300'
                  }`}
                >
                  <span
                    className={`flex h-4 w-4 shrink-0 items-center justify-center rounded border text-xs ${
                      interests.includes(i.value)
                        ? 'border-cyan-400 bg-cyan-400 text-navy-950'
                        : 'border-navy-500'
                    }`}
                  >
                    {interests.includes(i.value) && '✓'}
                  </span>
                  {i.label}
                </button>
              ))}
            </div>
          </div>
        )}

        {/* ── Step 4: Languages ── */}
        {step === 4 && (
          <div>
            <h2 className="font-display mb-1 text-2xl font-bold text-slate-50">
              What languages do you speak?
            </h2>
            <p className="mb-6 text-slate-400">Select all that apply.</p>

            <div className="flex flex-wrap gap-2">
              {LANGUAGES.map((l) => (
                <button
                  key={l}
                  type="button"
                  onClick={() => toggleArray(languages, l, setLanguages)}
                  className={`rounded-full px-4 py-2 text-sm font-medium transition-all ${
                    languages.includes(l)
                      ? 'bg-cyan-400 text-navy-950'
                      : 'border border-navy-600 text-slate-400 hover:border-cyan-400/50 hover:text-cyan-400'
                  }`}
                >
                  {l}
                </button>
              ))}
            </div>

            <div className="mt-4">
              <input
                type="text"
                value={otherLanguage}
                onChange={(e) => setOtherLanguage(e.target.value)}
                placeholder="Other language..."
                className="w-full max-w-xs rounded-lg border border-navy-600 bg-navy-900 px-4 py-3 text-slate-100 placeholder-slate-500 focus:border-cyan-400 focus:outline-none"
              />
            </div>
          </div>
        )}

        {/* ── Step 5: Community ── */}
        {step === 5 && (
          <div>
            <h2 className="font-display mb-1 text-2xl font-bold text-slate-50">
              Are any of these communities important to you?
            </h2>
            <p className="mb-2 text-slate-400">
              This helps us find resources specifically for your community.
            </p>
            <p className="mb-6 rounded-lg border border-navy-600 bg-navy-900 px-4 py-3 text-xs text-slate-500">
              This is completely optional. This information is private and only used to find
              opportunities relevant to you. It is never shared.
            </p>

            <div className="flex flex-wrap gap-2">
              {COMMUNITIES.map((c) => (
                <button
                  key={c.value}
                  type="button"
                  onClick={() => toggleArray(communities, c.value, setCommunities)}
                  className={`rounded-full px-4 py-2 text-sm font-medium transition-all ${
                    communities.includes(c.value)
                      ? 'bg-cyan-400 text-navy-950'
                      : 'border border-navy-600 text-slate-400 hover:border-cyan-400/50 hover:text-cyan-400'
                  }`}
                >
                  {c.label}
                </button>
              ))}
            </div>
          </div>
        )}

        {/* ── Step 6: Goals ── */}
        {step === 6 && (
          <div>
            <h2 className="font-display mb-1 text-2xl font-bold text-slate-50">
              In your own words, what are you hoping to find or achieve?
            </h2>
            <p className="mb-6 text-slate-400">
              Write as much or as little as you want. This is the most powerful signal for
              finding your best matches.
            </p>

            <div className="relative">
              <textarea
                value={goals}
                onChange={(e) => setGoals(e.target.value.substring(0, 500))}
                rows={5}
                placeholder="Example: I want to get my GED, find affordable childcare, and eventually get into a medical assistant program..."
                className="w-full rounded-lg border border-navy-600 bg-navy-900 px-4 py-3 text-slate-100 placeholder-slate-500 transition-colors focus:border-cyan-400 focus:outline-none"
              />
              <span className="absolute bottom-3 right-3 text-xs text-slate-500">
                {goals.length}/500
              </span>
            </div>
          </div>
        )}

        {/* Navigation */}
        <div className="mt-8 flex items-center justify-between">
          {step > 1 ? (
            <button
              type="button"
              onClick={() => setStep((s) => (s - 1) as Step)}
              className="text-sm text-slate-500 transition-colors hover:text-slate-300"
            >
              ← Back
            </button>
          ) : (
            <div />
          )}

          <div className="flex gap-3">
            {step < TOTAL_STEPS && step > 1 && (
              <button
                type="button"
                onClick={() => setStep((s) => (s + 1) as Step)}
                className="text-sm text-slate-500 transition-colors hover:text-slate-300"
              >
                Skip for now
              </button>
            )}

            {step < TOTAL_STEPS ? (
              <button
                type="button"
                onClick={() => setStep((s) => (s + 1) as Step)}
                className="rounded-lg bg-cyan-400 px-6 py-2.5 text-sm font-semibold text-navy-950 transition-all hover:bg-cyan-300"
              >
                Continue →
              </button>
            ) : (
              <button
                type="button"
                onClick={handleFinish}
                disabled={saving}
                className="rounded-lg bg-cyan-400 px-6 py-2.5 text-sm font-semibold text-navy-950 transition-all hover:bg-cyan-300 disabled:opacity-60"
              >
                {saving ? 'Setting up your account...' : 'Find My Opportunities →'}
              </button>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}
