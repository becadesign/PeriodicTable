import Link from 'next/link'
import type { Element } from '@/types/element'
import { CATEGORY_COLORS } from '@/lib/categories'

interface ElementCardProps {
  element: Element
  isHighlighted?: boolean
  isDimmed?: boolean
}

export function ElementCard({ element, isHighlighted, isDimmed }: ElementCardProps) {
  const colors = CATEGORY_COLORS[element.category]
  const mass = element.atomic_mass
    ? element.atomic_mass.toFixed(element.atomic_mass < 10 ? 4 : element.atomic_mass < 100 ? 3 : 2)
    : '—'

  return (
    <Link
      href={`/elemento/${element.symbol.toLowerCase()}`}
      className={[
        'block rounded transition-all duration-150 select-none',
        'border border-transparent hover:border-slate-400 dark:hover:border-slate-500',
        'focus-visible-ring',
        colors.bg, colors.bgDark, colors.text, colors.textDark,
        isDimmed ? 'opacity-20' : 'opacity-100',
        isHighlighted ? 'ring-2 ring-slate-600 dark:ring-slate-300' : '',
      ].join(' ')}
      style={{ padding: 'var(--cell-padding, 0.2rem)' }}
      aria-label={`${element.name_pt}, símbolo ${element.symbol}, número atômico ${element.number}, ${element.category}`}
      role="gridcell"
      aria-rowindex={element.period}
      aria-colindex={element.group_number ?? undefined}
    >
      <div style={{ fontSize: 'var(--cell-number-size, 0.5rem)', lineHeight: 1, opacity: 0.7 }}>
        {element.number}
      </div>
      <div style={{ fontSize: 'var(--cell-symbol-size, 0.875rem)', fontWeight: 700, lineHeight: 1.2 }}>
        {element.symbol}
      </div>
      <div style={{ fontSize: 'var(--cell-name-size, 0.45rem)', lineHeight: 1, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
        {element.name_pt}
      </div>
      <div style={{ fontSize: 'var(--cell-mass-size, 0.45rem)', lineHeight: 1, opacity: 0.7, marginTop: '0.1rem' }}>
        {mass}
      </div>
    </Link>
  )
}

export function ElementCardEmpty() {
  return <div role="gridcell" aria-hidden="true" />
}
