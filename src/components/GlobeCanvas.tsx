'use client'

import createGlobe from 'cobe'
import { useEffect, useRef } from 'react'

// [latitude, longitude] — cobe uses lat/lon (opposite of the old component)
const MARKERS: { location: [number, number]; size: number }[] = [
  { location: [42, -87],   size: 0.05 },  // Chicago
  { location: [41, -74],   size: 0.05 },  // New York
  { location: [34, -118],  size: 0.05 },  // Los Angeles
  { location: [26, -80],   size: 0.04 },  // Miami
  { location: [30, -94],   size: 0.04 },  // Houston
  { location: [47, -122],  size: 0.04 },  // Seattle
  { location: [40, -105],  size: 0.04 },  // Denver
  { location: [43, -79],   size: 0.04 },  // Toronto
  { location: [19, -99],   size: 0.05 },  // Mexico City
  { location: [21, -157],  size: 0.04 },  // Honolulu
  { location: [-23, -43],  size: 0.05 },  // Rio de Janeiro
  { location: [-34, -58],  size: 0.05 },  // Buenos Aires
  { location: [-12, -77],  size: 0.04 },  // Lima
  { location: [4,  -74],   size: 0.04 },  // Bogotá
  { location: [51,  0],    size: 0.05 },  // London
  { location: [48,  2],    size: 0.05 },  // Paris
  { location: [52, 13],    size: 0.05 },  // Berlin
  { location: [59, 18],    size: 0.04 },  // Stockholm
  { location: [60, 24],    size: 0.04 },  // Helsinki
  { location: [41, 28],    size: 0.05 },  // Istanbul
  { location: [55, 37],    size: 0.05 },  // Moscow
  { location: [30, 31],    size: 0.05 },  // Cairo
  { location: [-1, 36],    size: 0.04 },  // Nairobi
  { location: [-26, 28],   size: 0.05 },  // Johannesburg
  { location: [6,  3],     size: 0.04 },  // Lagos
  { location: [14, -17],   size: 0.04 },  // Dakar
  { location: [1, 103],    size: 0.05 },  // Singapore
  { location: [22, 114],   size: 0.05 },  // Hong Kong
  { location: [31, 121],   size: 0.05 },  // Shanghai
  { location: [36, 139],   size: 0.06 },  // Tokyo
  { location: [37, 127],   size: 0.05 },  // Seoul
  { location: [28, 77],    size: 0.05 },  // Delhi
  { location: [19, 72],    size: 0.05 },  // Mumbai
  { location: [25, 51],    size: 0.04 },  // Doha
  { location: [24, 46],    size: 0.04 },  // Riyadh
  { location: [33, 44],    size: 0.04 },  // Baghdad
  { location: [-34, 151],  size: 0.05 },  // Sydney
  { location: [-37, 144],  size: 0.04 },  // Melbourne
  { location: [-36, 174],  size: 0.04 },  // Auckland
  { location: [-32, 115],  size: 0.04 },  // Perth
]

export function GlobeCanvas() {
  const canvasRef = useRef<HTMLCanvasElement>(null)

  useEffect(() => {
    const canvas = canvasRef.current
    if (!canvas) return

    const parent = canvas.parentElement
    const SIZE = Math.min(500, parent ? parent.clientWidth : 500)
    const dpr  = window.devicePixelRatio || 1

    let phi = 0.6  // start showing Americas/Atlantic
    let rafId = 0

    const globe = createGlobe(canvas, {
      devicePixelRatio: dpr,
      width:  SIZE * dpr,
      height: SIZE * dpr,
      phi,
      theta: 0.18,
      dark: 1,
      diffuse: 1.3,
      mapSamples: 20000,
      mapBrightness: 5.5,
      baseColor:   [0.10, 0.55, 0.80],
      markerColor: [0.13, 0.83, 0.94],
      glowColor:   [0.10, 0.65, 0.90],
      markers: MARKERS,
    })

    // Only set width; CSS aspect-square keeps height equal so the globe never distorts
    canvas.style.width = SIZE + 'px'

    function animate() {
      phi += 0.0028
      globe.update({ phi })
      rafId = requestAnimationFrame(animate)
    }
    rafId = requestAnimationFrame(animate)

    return () => {
      cancelAnimationFrame(rafId)
      globe.destroy()
    }
  }, [])

  return (
    <canvas ref={canvasRef} className="block mx-auto max-w-full aspect-square" />
  )
}
