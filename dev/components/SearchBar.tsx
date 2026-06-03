'use client'

import { useId } from 'react'

interface SearchBarProps {
  value: string
  onChange: (value: string) => void
  resultCount: number
}

export function SearchBar({ value, onChange, resultCount }: SearchBarProps) {
  const inputId = useId()
  const statusId = useId()

  return (
    <div className="flex flex-col gap-1">
      <label htmlFor={inputId} className="sr-only">
        Buscar elemento por nome, símbolo ou número atômico
      </label>
      <input
        id={inputId}
        type="search"
        value={value}
        onChange={(e) => onChange(e.target.value)}
        placeholder="Buscar elemento..."
        className="px-3 py-2 rounded-lg border border-slate-300 dark:border-slate-600 bg-white dark:bg-slate-800 text-sm focus-visible-ring w-full max-w-xs"
        aria-describedby={statusId}
        aria-label="Buscar elemento por nome, símbolo ou número atômico"
      />
      <div
        id={statusId}
        role="status"
        aria-live="polite"
        aria-atomic="true"
        className="sr-only"
      >
        {value ? `${resultCount} elemento${resultCount !== 1 ? 's' : ''} encontrado${resultCount !== 1 ? 's' : ''}` : ''}
      </div>
    </div>
  )
}
