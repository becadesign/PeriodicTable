'use client'

import { useState, useEffect } from 'react'

type Orientation = 'portrait' | 'landscape'

export function useOrientation(): Orientation {
  const [orientation, setOrientation] = useState<Orientation>('landscape')

  useEffect(() => {
    function update() {
      const isPortrait = window.matchMedia('(orientation: portrait) and (max-width: 767px)').matches
      setOrientation(isPortrait ? 'portrait' : 'landscape')
    }

    update()
    const mq = window.matchMedia('(orientation: portrait) and (max-width: 767px)')
    mq.addEventListener('change', update)
    return () => mq.removeEventListener('change', update)
  }, [])

  return orientation
}
