'use client'

import { useEffect, useRef } from 'react'

// Simplified continent outlines as [lon, lat] arrays
const CONTINENTS: [number, number][][] = [
  // North America
  [
    [-168, 60], [-150, 62], [-135, 58], [-130, 54], [-125, 48],
    [-124, 46], [-124, 37], [-118, 34], [-97, 26], [-94, 30],
    [-90, 29], [-82, 24], [-87, 16], [-83, 10], [-80, 8],
    [-80, 25], [-74, 41], [-67, 47], [-55, 50], [-55, 47],
    [-65, 44], [-78, 43], [-97, 50], [-110, 55], [-130, 58],
    [-140, 60], [-168, 60],
  ],
  // South America
  [
    [-80, 10], [-74, 11], [-66, 10], [-62, 10], [-53, 5],
    [-50, 0], [-35, -5], [-35, -55], [-53, -55], [-65, -55],
    [-68, -45], [-72, -35], [-75, -15], [-78, -2], [-80, 0], [-80, 10],
  ],
  // Europe
  [
    [-9, 38], [-9, 44], [0, 51], [2, 51], [5, 53],
    [10, 54], [18, 57], [24, 57], [27, 68], [30, 71],
    [30, 60], [37, 55], [32, 46], [28, 41], [23, 38],
    [15, 38], [12, 38], [0, 37], [-5, 36], [-9, 38],
  ],
  // Africa
  [
    [-17, 15], [-15, 11], [0, 6], [10, 5], [15, 4],
    [30, 4], [36, -1], [42, -12], [35, -35], [25, -35],
    [18, -35], [12, -22], [8, 4], [15, 15],
    [30, 20], [43, 12], [50, 12], [42, -12],
  ],
  // Asia
  [
    [28, 41], [37, 55], [50, 55], [60, 55], [80, 72],
    [140, 72], [170, 64], [160, 54], [145, 44], [140, 35],
    [130, 32], [122, 30], [120, 22], [110, 18], [105, 10],
    [100, 5], [80, 10], [72, 22], [65, 25], [58, 22],
    [50, 28], [44, 30], [38, 37], [35, 36], [28, 41],
  ],
  // Australia
  [
    [114, -22], [122, -18], [130, -12], [138, -13],
    [148, -18], [154, -25], [152, -30], [151, -34],
    [148, -38], [140, -38], [130, -33], [116, -32],
    [114, -26], [114, -22],
  ],
  // Greenland
  [
    [-44, 83], [-20, 83], [-18, 75], [-22, 70],
    [-30, 68], [-44, 76], [-55, 78], [-44, 83],
  ],
]

// Key world cities for constellation dots
const CITIES: [number, number][] = [
  [-87, 42], [-74, 41], [-118, 34], [-80, 26], [-94, 30],
  [-122, 47], [-79, 43], [-99, 19], [-157, 21], [-105, 40],
  [-43, -23], [-58, -34], [-77, -12], [-74, 4], [-66, 10],
  [0, 51], [2, 48], [13, 52], [28, 41], [37, 55],
  [12, 41], [18, 59], [24, 60], [23, 38],
  [36, -1], [28, -26], [3, 6], [31, 30], [-17, 14], [18, -4],
  [103, 1], [114, 22], [121, 31], [139, 36], [77, 28],
  [72, 19], [127, 37], [37, 25], [51, 25], [44, 33],
  [151, -34], [144, -37], [174, -37], [115, -32],
]

function toXYZ(lon: number, lat: number, rotY: number, R: number) {
  const φ = (90 - lat) * Math.PI / 180
  const θ = (lon + rotY) * Math.PI / 180
  return {
    x: Math.sin(φ) * Math.cos(θ) * R,
    y: Math.cos(φ) * R,
    z: Math.sin(φ) * Math.sin(θ),
  }
}

function angularDist(a: [number, number], b: [number, number]) {
  const dLat = (b[1] - a[1]) * Math.PI / 180
  const dLon = (b[0] - a[0]) * Math.PI / 180
  const s = Math.sin(dLat / 2) ** 2 +
    Math.cos(a[1] * Math.PI / 180) * Math.cos(b[1] * Math.PI / 180) * Math.sin(dLon / 2) ** 2
  return 2 * Math.atan2(Math.sqrt(s), Math.sqrt(1 - s)) * 180 / Math.PI
}

export function GlobeCanvas() {
  const canvasRef = useRef<HTMLCanvasElement>(null)
  const rotRef = useRef(0)
  const rafRef = useRef(0)

  useEffect(() => {
    const canvas = canvasRef.current
    if (!canvas) return
    const ctx = canvas.getContext('2d') as CanvasRenderingContext2D
    if (!ctx) return

    const dpr = window.devicePixelRatio || 1
    const SIZE = 420
    canvas.width = SIZE * dpr
    canvas.height = SIZE * dpr
    canvas.style.width = SIZE + 'px'
    canvas.style.height = SIZE + 'px'
    ctx.scale(dpr, dpr)

    const cx = SIZE / 2
    const cy = SIZE / 2
    const R = SIZE * 0.42

    function draw() {
      ctx.clearRect(0, 0, SIZE, SIZE)
      const rot = rotRef.current

      // Outer atmosphere glow
      const atmo = ctx.createRadialGradient(cx, cy, R * 0.75, cx, cy, R * 1.22)
      atmo.addColorStop(0, 'rgba(34, 211, 238, 0)')
      atmo.addColorStop(0.7, 'rgba(34, 211, 238, 0.04)')
      atmo.addColorStop(1, 'rgba(34, 211, 238, 0.22)')
      ctx.beginPath()
      ctx.arc(cx, cy, R * 1.22, 0, Math.PI * 2)
      ctx.fillStyle = atmo
      ctx.fill()

      // Subtle inner fill so globe reads as a volume
      const inner = ctx.createRadialGradient(cx - R * 0.25, cy - R * 0.25, 0, cx, cy, R)
      inner.addColorStop(0, 'rgba(14, 28, 60, 0.28)')
      inner.addColorStop(1, 'rgba(8, 12, 28, 0.10)')
      ctx.beginPath()
      ctx.arc(cx, cy, R, 0, Math.PI * 2)
      ctx.fillStyle = inner
      ctx.fill()

      // Latitude rings
      for (let lat = -60; lat <= 90; lat += 30) {
        ctx.beginPath()
        let first = true
        for (let lon = 0; lon <= 361; lon += 2) {
          const p = toXYZ(lon, lat, rot, R)
          if (p.z < 0) { first = true; continue }
          const sx = cx + p.x, sy = cy - p.y
          first ? ctx.moveTo(sx, sy) : ctx.lineTo(sx, sy)
          first = false
        }
        ctx.strokeStyle = `rgba(34, 211, 238, ${lat === 0 ? 0.25 : 0.14})`
        ctx.lineWidth = lat === 0 ? 0.9 : 0.5
        ctx.stroke()
      }

      // Longitude meridians
      for (let lon = 0; lon < 360; lon += 30) {
        ctx.beginPath()
        let first = true
        for (let lat = -90; lat <= 90; lat += 2) {
          const p = toXYZ(lon, lat, rot, R)
          if (p.z < 0) { first = true; continue }
          const sx = cx + p.x, sy = cy - p.y
          first ? ctx.moveTo(sx, sy) : ctx.lineTo(sx, sy)
          first = false
        }
        ctx.strokeStyle = 'rgba(34, 211, 238, 0.10)'
        ctx.lineWidth = 0.5
        ctx.stroke()
      }

      // Continent outlines
      for (const polygon of CONTINENTS) {
        ctx.beginPath()
        let first = true
        for (const [lon, lat] of polygon) {
          const p = toXYZ(lon, lat, rot, R)
          if (p.z < -0.05) { first = true; continue }
          const alpha = Math.max(0, p.z)
          ctx.globalAlpha = 0.4 + alpha * 0.6
          const sx = cx + p.x, sy = cy - p.y
          first ? ctx.moveTo(sx, sy) : ctx.lineTo(sx, sy)
          first = false
        }
        ctx.globalAlpha = 1
        ctx.strokeStyle = 'rgba(34, 211, 238, 0.7)'
        ctx.lineWidth = 1.3
        ctx.stroke()
      }

      // Constellation lines between nearby cities
      for (let i = 0; i < CITIES.length; i++) {
        for (let j = i + 1; j < CITIES.length; j++) {
          const d = angularDist(CITIES[i], CITIES[j])
          if (d > 42) continue
          const a = toXYZ(CITIES[i][0], CITIES[i][1], rot, R)
          const b = toXYZ(CITIES[j][0], CITIES[j][1], rot, R)
          if (a.z < 0 || b.z < 0) continue
          const alpha = (1 - d / 42) * 0.28
          ctx.beginPath()
          ctx.moveTo(cx + a.x, cy - a.y)
          ctx.lineTo(cx + b.x, cy - b.y)
          ctx.strokeStyle = `rgba(56, 189, 248, ${alpha})`
          ctx.lineWidth = 0.7
          ctx.stroke()
        }
      }

      // City dots with glow
      for (const [lon, lat] of CITIES) {
        const p = toXYZ(lon, lat, rot, R)
        if (p.z < 0.05) continue
        const alpha = 0.45 + p.z * 0.55
        // Outer glow
        ctx.beginPath()
        ctx.arc(cx + p.x, cy - p.y, 6, 0, Math.PI * 2)
        ctx.fillStyle = `rgba(34, 211, 238, ${alpha * 0.12})`
        ctx.fill()
        // Core dot
        ctx.beginPath()
        ctx.arc(cx + p.x, cy - p.y, 2.2, 0, Math.PI * 2)
        ctx.fillStyle = `rgba(34, 211, 238, ${alpha})`
        ctx.fill()
      }

      // Globe rim
      ctx.beginPath()
      ctx.arc(cx, cy, R, 0, Math.PI * 2)
      ctx.strokeStyle = 'rgba(34, 211, 238, 0.35)'
      ctx.lineWidth = 1.5
      ctx.stroke()

      rotRef.current += 0.10
    }

    function animate() {
      draw()
      rafRef.current = requestAnimationFrame(animate)
    }
    animate()
    return () => cancelAnimationFrame(rafRef.current)
  }, [])

  return (
    <canvas
      ref={canvasRef}
      className="w-full max-w-[420px] drop-shadow-[0_0_40px_rgba(34,211,238,0.18)]"
    />
  )
}
