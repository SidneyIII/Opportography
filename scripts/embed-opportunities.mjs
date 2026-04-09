/**
 * One-time script: embed all opportunities using Voyage AI and store in Supabase.
 * Run with: node scripts/embed-opportunities.mjs
 *
 * Only rows with embedding IS NULL are processed, so it's safe to re-run.
 */

import { createClient } from '@supabase/supabase-js'
import { readFileSync } from 'fs'

// Load .env.local manually (no dotenv dependency needed)
const env = Object.fromEntries(
  readFileSync('.env.local', 'utf8')
    .split('\n')
    .filter(l => l.includes('=') && !l.startsWith('#'))
    .map(l => {
      const idx = l.indexOf('=')
      return [l.slice(0, idx).trim(), l.slice(idx + 1).trim()]
    })
)

const SUPABASE_URL = env.NEXT_PUBLIC_SUPABASE_URL
const SERVICE_KEY = env.SUPABASE_SERVICE_ROLE_KEY
const VOYAGE_API_KEY = env.VOYAGE_API_KEY

if (!SUPABASE_URL || !SERVICE_KEY || !VOYAGE_API_KEY) {
  console.error('Missing env vars. Check .env.local for NEXT_PUBLIC_SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, VOYAGE_API_KEY')
  process.exit(1)
}

const supabase = createClient(SUPABASE_URL, SERVICE_KEY)

// Build a rich text string for each opportunity so the embedding captures full meaning
function buildEmbedText(opp) {
  return [
    opp.title,
    opp.organization,
    opp.type?.replace(/_/g, ' '),
    opp.city,
    opp.location,
    opp.description,
    (opp.identity_tags ?? []).join(' '),
    (opp.category_tags ?? []).join(' '),
  ].filter(Boolean).join(' | ')
}

async function embedBatch(texts, retries = 5) {
  for (let attempt = 1; attempt <= retries; attempt++) {
    const res = await fetch('https://api.voyageai.com/v1/embeddings', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${VOYAGE_API_KEY}`,
      },
      body: JSON.stringify({
        model: 'voyage-3-lite',
        input: texts,
        input_type: 'document',
      }),
    })

    if (res.status === 429) {
      const wait = attempt * 20000 // 20s, 40s, 60s...
      console.log(`  Rate limited. Waiting ${wait / 1000}s before retry ${attempt}/${retries}...`)
      await new Promise(r => setTimeout(r, wait))
      continue
    }

    if (!res.ok) {
      const err = await res.text()
      throw new Error(`Voyage API error: ${res.status} ${err}`)
    }

    const data = await res.json()
    return data.data.map(d => d.embedding)
  }
  throw new Error('Max retries exceeded on rate limit')
}

async function main() {
  console.log('Fetching opportunities without embeddings...')

  const { data: opps, error } = await supabase
    .from('opportunities')
    .select('id, title, organization, type, city, location, description, identity_tags, category_tags')
    .is('embedding', null)
    .eq('is_active', true)

  if (error) { console.error(error); process.exit(1) }

  console.log(`Found ${opps.length} opportunities to embed.`)
  if (opps.length === 0) { console.log('All done — nothing to embed.'); return }

  // Process in batches of 64 (Voyage limit)
  const BATCH = 64
  let done = 0

  for (let i = 0; i < opps.length; i += BATCH) {
    const batch = opps.slice(i, i + BATCH)
    const texts = batch.map(buildEmbedText)

    console.log(`Embedding batch ${Math.floor(i / BATCH) + 1}/${Math.ceil(opps.length / BATCH)} (${batch.length} opps)...`)

    const embeddings = await embedBatch(texts)

    // Upsert embeddings back to Supabase
    for (let j = 0; j < batch.length; j++) {
      const { error: upErr } = await supabase
        .from('opportunities')
        .update({ embedding: embeddings[j] })
        .eq('id', batch[j].id)

      if (upErr) console.error(`Failed to update ${batch[j].id}:`, upErr)
    }

    done += batch.length
    console.log(`  ${done}/${opps.length} done`)

    // Small delay to stay under rate limits
    if (i + BATCH < opps.length) await new Promise(r => setTimeout(r, 300))
  }

  console.log('All opportunities embedded successfully.')
}

main().catch(err => { console.error(err); process.exit(1) })
