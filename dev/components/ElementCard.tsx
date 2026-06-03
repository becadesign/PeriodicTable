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
  const mass = element.atomic_mass ? element.atomic_mass.toFixed(element.atomic_mass < 10 ? 4 : element.atomic_mass < 100 ? 3 : 2) : '—'

  return (
    <Link
      href={`/elemento/${element.symbol.toLowerCase()}`}
      className={[
        'block rounded p-1 transition-all duration-150',
        'border border-transparent hover:border-slate-400 dark:hover:border-slate-500',
        'focus-visible-ring',
        colors.bg, colors.bgDark, colors.text, colors.textDark,
        isDimmed ? 'opacity-20' : 'opacity-100',
        isHighlighted ? 'ring-2 ring-slate-600 dark:ring-slate-300' : '',
      ].join(' ')}
      aria-label={`${element.name_pt}, símbolo ${element.symbol}, número atômico ${element.number}, ${element.category}`}
      role="gridcell"
      aria-rowindex={element.period}
      aria-colindex={element.group_number ?? undefined}
    >
      <div className="text-[0.55rem] leading-none opacity-70">{element.number}</div>
      <div className="text-base font-bold leading-tight">{element.symbol}</div>
      <div className="text-[0.5rem] leading-none truncate">{element.name_pt}</div>
      <div className="text-[0.45rem] leading-none opacity-70 mt-0.5">{mass}</div>
    </Link>
  )
}

export function ElementCardEmpty() {
  return <div role="gridcell" aria-hidden="true" />
}
