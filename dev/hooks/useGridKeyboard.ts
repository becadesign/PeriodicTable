'use client'

import { useState, useCallback, RefObject } from 'react'

interface Position {
  row: number
  col: number
}

// Mapa [row][col] → número do elemento (1-118)
type GridMap = Map<string, number>

export function useGridKeyboard(gridRef: RefObject<HTMLDivElement>, gridMap: GridMap) {
  // Começa com o H (número 1)
  const [focusedNumber, setFocusedNumber] = useState<number>(1)

  function posKey(row: number, col: number) {
    return `${row},${col}`
  }

  // Mapa inverso: número → posição
  const numberToPos = useCallback(
    (num: number): Position | null => {
      let result: Position | null = null
      gridMap.forEach((n, key) => {
        if (n === num && !result) {
          const [r, c] = key.split(',').map(Number)
          result = { row: r, col: c }
        }
      })
      return result
    },
    [gridMap]
  )

  function findNearest(fromRow: number, fromCol: number, dRow: number, dCol: number): number | null {
    let r = fromRow + dRow
    let c = fromCol + dCol

    // percorre até encontrar um elemento ou sair dos limites (9 linhas × 18 colunas)
    while (r >= 1 && r <= 9 && c >= 1 && c <= 18) {
      const found = gridMap.get(posKey(r, c))
      if (found !== undefined) return found
      r += dRow
      c += dCol
    }
    return null
  }

  function focusElement(num: number) {
    if (!gridRef.current) return
    const el = gridRef.current.querySelector<HTMLElement>(`[data-element-number="${num}"]`)
    if (el) {
      setFocusedNumber(num)
      el.focus()
    }
  }

  const handleKeyDown = useCallback(
    (e: React.KeyboardEvent) => {
      const pos = numberToPos(focusedNumber)
      if (!pos) return

      const { row, col } = pos
      let target: number | null = null

      switch (e.key) {
        case 'ArrowRight':
          target = findNearest(row, col, 0, 1)
          break
        case 'ArrowLeft':
          target = findNearest(row, col, 0, -1)
          break
        case 'ArrowDown':
          target = findNearest(row, col, 1, 0)
          break
        case 'ArrowUp':
          target = findNearest(row, col, -1, 0)
          break
        default:
          return
      }

      if (target !== null) {
        e.preventDefault()
        focusElement(target)
      }
    },
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [focusedNumber, gridMap, numberToPos]
  )

  return { focusedNumber, setFocusedNumber, handleKeyDown }
}
