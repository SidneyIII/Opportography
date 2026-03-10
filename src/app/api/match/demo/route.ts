import { NextResponse } from 'next/server'
import { runDemoMatch } from '@/lib/matching-engine'
import { checkRateLimit, getClientIp } from '@/lib/rate-limit'

const INJECTION_PATTERNS = [
  /ignore\s+(previous|prior|above)\s+instructions/i,
  /you\s+are\s+now/i,
  /forget\s+(everything|all)/i,
  /new\s+instruction/i,
  /system\s+prompt/i,
]

function sanitizeInput(input: string): string {
  return input
    .replace(/<[^>]*>/g, '') // Strip HTML tags
    .replace(/&[a-z]+;/gi, '') // Strip HTML entities
    .trim()
}

function hasInjectionAttempt(input: string): boolean {
  return INJECTION_PATTERNS.some((p) => p.test(input))
}

export async function POST(request: Request) {
  try {
    const body = await request.json()
    const raw: string = body?.input ?? ''

    // Validate input
    if (!raw || typeof raw !== 'string') {
      return NextResponse.json({ error: 'Input is required.' }, { status: 400 })
    }

    const sanitized = sanitizeInput(raw)

    if (sanitized.length < 10) {
      return NextResponse.json(
        {
          error:
            "We couldn't understand that. Try describing yourself and what you're looking for — like 'I'm a student looking for internships.'",
        },
        { status: 400 }
      )
    }

    if (sanitized.length > 500) {
      return NextResponse.json({ error: 'Input must be 500 characters or less.' }, { status: 400 })
    }

    if (hasInjectionAttempt(sanitized)) {
      return NextResponse.json(
        {
          error:
            "We couldn't understand that. Try describing yourself and what you're looking for.",
        },
        { status: 400 }
      )
    }

    // IP rate limiting
    const ip = getClientIp(request)
    const { allowed, remaining } = checkRateLimit(ip)

    if (!allowed) {
      return NextResponse.json(
        {
          error: 'rate_limited',
          message:
            "You've reached the limit for free matches. Create a free account for unlimited AI matching!",
        },
        { status: 429 }
      )
    }

    // Run matching pipeline
    const matches = await runDemoMatch(sanitized)

    const response = NextResponse.json({ matches, remaining })

    // Set session cookie to track demo usage
    response.cookies.set('opportography-demo-used', '1', {
      httpOnly: false, // Needs to be readable by client JS for sessionStorage check
      sameSite: 'strict',
      path: '/',
      maxAge: 60 * 60 * 24, // 24 hours
    })

    return response
  } catch (error) {
    console.error('Demo match error:', error)
    return NextResponse.json(
      { error: 'Something went wrong. Please try again.' },
      { status: 500 }
    )
  }
}
