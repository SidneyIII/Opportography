'use client'

import { useEffect } from 'react'

export function ScrollRevealInit() {
  useEffect(() => {
    // ── Load-time elements (hero + carousel) ──────────────────────────────
    const loadEls = document.querySelectorAll<HTMLElement>('[data-reveal="load"]')
    const loadTimer = setTimeout(() => {
      loadEls.forEach((el) => el.classList.add('is-visible'))
    }, 150)

    const scrollEls = Array.from(
      document.querySelectorAll<HTMLElement>('.scroll-reveal:not([data-reveal="load"])')
    )

    // ── Fallback: no IntersectionObserver support ─────────────────────────
    if (typeof IntersectionObserver === 'undefined') {
      scrollEls.forEach((el) => el.classList.add('is-visible'))
      return () => clearTimeout(loadTimer)
    }

    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add('is-visible')
            observer.unobserve(entry.target)
          }
        })
      },
      {
        threshold: 0.05, // lower threshold — fire as soon as 5% is visible
        rootMargin: '0px 0px 0px 0px', // no negative margin — don't delay trigger
      },
    )

    scrollEls.forEach((el) => {
      // If the element is already in the viewport when the page loads,
      // add is-visible immediately rather than waiting for a scroll event
      const rect = el.getBoundingClientRect()
      if (rect.top < window.innerHeight && rect.bottom > 0) {
        el.classList.add('is-visible')
      } else {
        observer.observe(el)
      }
    })

    return () => {
      clearTimeout(loadTimer)
      observer.disconnect()
    }
  }, [])

  return null
}
