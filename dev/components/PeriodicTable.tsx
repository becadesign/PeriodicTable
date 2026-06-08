'use client'

import { useState, useMemo, useRef } from 'react'
import type { Element, Category } from '@/types/element'
import { ElementCard, ElementCardEmpty } from './ElementCard'
import { Legend } from './Legend'
import { SearchBar } from './SearchBar'
import { MobileList } from './MobileList'
import { useOrientation } from '@/hooks/useOrientation'
import { useGridKeyboard } from '@/hooks/useGridKeyboard'

// [row, col] — linhas 8 e 9 são lantanídeos e actinídeos
const ELEMENT_POSITIONS: Record<number, [number, number]> = {
  1: [1,1], 2: [1,18],
  3: [2,1], 4: [2,2], 5: [2,13], 6: [2,14], 7: [2,15], 8: [2,16], 9: [2,17], 10: [2,18],
  11: [3,1], 12: [3,2], 13: [3,13], 14: [3,14], 15: [3,15], 16: [3,16], 17: [3,17], 18: [3,18],
  19: [4,1], 20: [4,2], 21: [4,3], 22: [4,4], 23: [4,5], 24: [4,6], 25: [4,7], 26: [4,8], 27: [4,9], 28: [4,10], 29: [4,11], 30: [4,12], 31: [4,13], 32: [4,14], 33: [4,15], 34: [4,16], 35: [4,17], 36: [4,18],
  37: [5,1], 38: [5,2], 39: [5,3], 40: [5,4], 41: [5,5], 42: [5,6], 43: [5,7], 44: [5,8], 45: [5,9], 46: [5,10], 47: [5,11], 48: [5,12], 49: [5,13], 50: [5,14], 51: [5,15], 52: [5,16], 53: [5,17], 54: [5,18],
  55: [6,1], 56: [6,2], 57: [6,3], 72: [6,4], 73: [6,5], 74: [6,6], 75: [6,7], 76: [6,8], 77: [6,9], 78: [6,10], 79: [6,11], 80: [6,12], 81: [6,13], 82: [6,14], 83: [6,15], 84: [6,16], 85: [6,17], 86: [6,18],
  87: [7,1], 88: [7,2], 89: [7,3], 104: [7,4], 105: [7,5], 106: [7,6], 107: [7,7], 108: [7,8], 109: [7,9], 110: [7,10], 111: [7,11], 112: [7,12], 113: [7,13], 114: [7,14], 115: [7,15], 116: [7,16], 117: [7,17], 118: [7,18],
  58: [8,4], 59: [8,5], 60: [8,6], 61: [8,7], 62: [8,8], 63: [8,9], 64: [8,10], 65: [8,11], 66: [8,12], 67: [8,13], 68: [8,14], 69: [8,15], 70: [8,16], 71: [8,17],
  90: [9,4], 91: [9,5], 92: [9,6], 93: [9,7], 94: [9,8], 95: [9,9], 96: [9,10], 97: [9,11], 98: [9,12], 99: [9,13], 100: [9,14], 101: [9,15], 102: [9,16], 103: [9,17],
}

// Mapa "row,col" → número do elemento para navegação por teclado
const GRID_MAP = new Map<string, number>(
  Object.entries(ELEMENT_POSITIONS).map(([num, [row, col]]) => [`${row},${col}`, Number(num)])
)

interface PeriodicTableProps {
  elements: Element[]
}

export function PeriodicTable({ elements }: PeriodicTableProps) {
  const [search, setSearch] = useState('')
  const [activeCategory, setActiveCategory] = useState<Category | null>(null)
  const orientation = useOrientation()
  const gridRef = useRef<HTMLDivElement>(null)
  const { focusedNumber, setFocusedNumber, handleKeyDown } = useGridKeyboard(gridRef, GRID_MAP)

  const filteredNumbers = useMemo(() => {
    if (!search && !activeCategory) return null
    const term = search.toLowerCase()
    return new Set(
      elements
        .filter((el) => {
          const matchesSearch = !search || (
            el.name_pt.toLowerCase().includes(term) ||
            el.symbol.toLowerCase().includes(term) ||
            el.number.toString() === term
          )
          const matchesCategory = !activeCategory || el.category === activeCategory
          return matchesSearch && matchesCategory
        })
        .map((el) => el.number)
    )
  }, [search, activeCategory, elements])

  const resultCount = filteredNumbers ? filteredNumbers.size : elements.length

  function toggleCategory(category: Category) {
    setActiveCategory((prev) => (prev === category ? null : category))
  }

  const mainGrid: (Element | null)[][] = Array.from({ length: 7 }, () => Array(18).fill(null))
  const lantGrid: (Element | null)[] = Array(14).fill(null)
  const actGrid: (Element | null)[] = Array(14).fill(null)

  elements.forEach((el) => {
    const pos = ELEMENT_POSITIONS[el.number]
    if (!pos) return
    const [row, col] = pos
    if (row <= 7) mainGrid[row - 1][col - 1] = el
    else if (row === 8) lantGrid[col - 4] = el
    else if (row === 9) actGrid[col - 4] = el
  })

  function renderCard(el: Element | null, key: string) {
    if (!el) return <ElementCardEmpty key={key} />
    const isHighlighted = filteredNumbers ? filteredNumbers.has(el.number) : false
    const isDimmed = filteredNumbers ? !filteredNumbers.has(el.number) : false
    // Roving tabindex: só o elemento focado tem tabIndex=0
    const tabIndex = el.number === focusedNumber ? 0 : -1
    return (
      <ElementCard
        key={el.number}
        element={el}
        isHighlighted={isHighlighted}
        isDimmed={isDimmed}
        tabIndex={tabIndex}
        onFocus={setFocusedNumber}
      />
    )
  }

  const isMobilePortrait = orientation === 'portrait'

  return (
    <div className="flex flex-col gap-3 sm:gap-4">
      <div className="flex flex-wrap gap-2 sm:gap-3 items-center justify-between">
        <SearchBar value={search} onChange={setSearch} resultCount={resultCount} />
        {isMobilePortrait && (
          <p className="text-xs text-slate-500 dark:text-slate-400 w-full sm:w-auto" aria-live="polite">
            Gire o dispositivo para ver a tabela completa
          </p>
        )}
      </div>

      <Legend activeCategory={activeCategory} onToggle={toggleCategory} />

      {isMobilePortrait ? (
        <MobileList elements={elements} search={search} activeCategory={activeCategory} />
      ) : (
        /* eslint-disable jsx-a11y/interactive-supports-focus */
        <div
          ref={gridRef}
          className="periodic-table-scroll element-grid"
          role="grid"
          aria-label="Tabela periódica dos elementos químicos. Use as setas do teclado para navegar entre elementos."
          aria-rowcount={9}
          aria-colcount={18}
          onKeyDown={handleKeyDown}
        >
          <div
            className="grid grid-cols-periodic gap-px"
            style={{ minWidth: 'var(--cell-min-width, 560px)' }}
            role="rowgroup"
          >
            {mainGrid.map((row, rowIdx) =>
              row.map((el, colIdx) => renderCard(el, `${rowIdx}-${colIdx}`))
            )}
          </div>
          <div
            className="mt-1 grid grid-cols-periodic gap-px"
            style={{ minWidth: 'var(--cell-min-width, 560px)' }}
            role="rowgroup"
            aria-label="Lantanídeos e Actinídeos"
          >
            <div className="col-span-3" aria-hidden="true" />
            {lantGrid.map((el, i) => renderCard(el, `lant-${i}`))}
            <div aria-hidden="true" />
            <div className="col-span-3" aria-hidden="true" />
            {actGrid.map((el, i) => renderCard(el, `act-${i}`))}
            <div aria-hidden="true" />
          </div>
        </div>
      )}
    </div>
  )
}
