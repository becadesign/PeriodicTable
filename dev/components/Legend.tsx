'use client'

import { CATEGORY_COLORS, CATEGORIES } from '@/lib/categories'
import type { Category } from '@/types/element'

interface LegendProps {
  activeCategory: Category | null
  onToggle: (category: Category) => void
}

export function Legend({ activeCategory, onToggle }: LegendProps) {
  return (
    <nav aria-label="Filtrar por categoria">
      <ul className="flex flex-wrap gap-1.5 justify-center" role="list">
        {CATEGORIES.map((category) => {
          const colors = CATEGORY_COLORS[category]
          const isActive = activeCategory === category

          return (
            <li key={category}>
              <button
                onClick={() => onToggle(category)}
                className={[
                  'flex items-center gap-1.5 px-2 py-1 rounded text-xs font-medium transition-all',
                  'focus-visible-ring min-h-[44px]',
                  colors.bg, colors.bgDark, colors.text, colors.textDark,
                  isActive ? 'ring-2 ring-slate-700 dark:ring-slate-200 scale-105' : 'hover:scale-105',
                ].join(' ')}
                aria-pressed={isActive}
                aria-label={`${isActive ? 'Remover filtro' : 'Filtrar por'} ${colors.label}`}
              >
                <span
                  className={`w-3 h-3 rounded-sm flex-shrink-0 ${colors.bg} ${colors.bgDark} border border-current`}
                  aria-hidden="true"
                />
                {colors.label}
              </button>
            </li>
          )
        })}
      </ul>
    </nav>
  )
}
