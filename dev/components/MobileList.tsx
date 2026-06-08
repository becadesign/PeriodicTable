'use client'

import { useMemo } from 'react'
import type { Element, Category } from '@/types/element'
import { CATEGORY_COLORS, CATEGORIES } from '@/lib/categories'
import { ElementCard } from './ElementCard'

interface MobileListProps {
  elements: Element[]
  search: string
  activeCategory: Category | null
}

export function MobileList({ elements, search, activeCategory }: MobileListProps) {
  const filtered = useMemo(() => {
    const term = search.toLowerCase()
    return elements.filter((el) => {
      const matchesSearch = !search || (
        el.name_pt.toLowerCase().includes(term) ||
        el.symbol.toLowerCase().includes(term) ||
        el.number.toString() === term
      )
      const matchesCategory = !activeCategory || el.category === activeCategory
      return matchesSearch && matchesCategory
    })
  }, [elements, search, activeCategory])

  const byCategory = useMemo(() => {
    const map = new Map<Category, Element[]>()
    CATEGORIES.forEach((cat) => map.set(cat, []))
    filtered.forEach((el) => {
      const list = map.get(el.category)
      if (list) list.push(el)
    })
    return map
  }, [filtered])

  if (filtered.length === 0) {
    return (
      <p role="status" className="text-center text-slate-500 py-12">
        Nenhum elemento encontrado.
      </p>
    )
  }

  return (
    <div className="flex flex-col gap-6">
      {CATEGORIES.map((category) => {
        const items = byCategory.get(category) ?? []
        if (items.length === 0) return null
        const colors = CATEGORY_COLORS[category]
        return (
          <section key={category} aria-labelledby={`cat-${category}`}>
            <h2
              id={`cat-${category}`}
              className={`text-sm font-semibold px-3 py-1.5 rounded-lg mb-3 inline-block ${colors.bg} ${colors.bgDark} ${colors.text} ${colors.textDark}`}
            >
              {colors.label}
            </h2>
            <div
              className="grid grid-cols-3 gap-2"
              role="list"
              aria-label={`Elementos: ${colors.label}`}
            >
              {items.map((el) => (
                <div key={el.number} role="listitem">
                  <ElementCard element={el} />
                </div>
              ))}
            </div>
          </section>
        )
      })}
    </div>
  )
}
