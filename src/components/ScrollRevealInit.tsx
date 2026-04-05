'use client'

import { useEffect } from 'react'

export function ScrollRevealInit() {
  useEffect(() => {
    // ── Load-time elements (hero + carousel) ──────────────────────────────
    // Fire after a brief settle so the browser has painted the initial frame
    const loadEls = document.querySelectorAll<HTMLElement>('[data-reveal="load"]')
    const loadTimer = setTimeout(() => {
      loadEls.forEach((el) => el.classList.add('is-visible'))
    }, 150)

    // ── Scroll-triggered elements ─────────────────────────────────────────
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add('is-visible')
            observer.unobserve(entry.target) // fire once only
          }
        })
      },
      {
        threshold: 0.10,
        rootMargin: '0px 0px -40px 0px', // trigger slightly before fully in view
      },
    )

    // Observe all scroll-reveal elements that are NOT load-triggered
    document
      .querySelectorAll<HTMLElement>('.scroll-reveal:not([data-reveal="load"])')
      .forEach((el) => observer.observe(el))

    return () => {
      clearTimeout(loadTimer)
      observer.disconnect()
    }
  }, [])

  return null
}
