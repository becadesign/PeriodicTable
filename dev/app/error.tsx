'use client'

import { useEffect } from 'react'

interface Props {
  error: Error & { digest?: string }
  reset: () => void
}

export default function Error({ error, reset }: Props) {
  useEffect(() => {
    console.error(error)
  }, [error])

  return (
    <div className="min-h-screen flex items-center justify-center px-4" role="alert">
      <div className="text-center max-w-md">
        <h2 className="text-xl font-semibold mb-2">Erro ao carregar a tabela</h2>
        <p className="text-slate-500 dark:text-slate-400 mb-6 text-sm">
          Não foi possível buscar os dados dos elementos. Verifique sua conexão e tente novamente.
        </p>
        <button
          onClick={reset}
          className="px-4 py-2 bg-slate-800 dark:bg-slate-200 text-white dark:text-slate-900 rounded-lg text-sm font-medium hover:opacity-90 focus-visible-ring"
        >
          Tentar novamente
        </button>
      </div>
    </div>
  )
}
