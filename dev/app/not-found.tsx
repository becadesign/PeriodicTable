import Link from 'next/link'
import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Não encontrado',
}

export default function NotFound() {
  return (
    <div className="min-h-screen flex items-center justify-center px-4">
      <div className="text-center max-w-md">
        <p className="text-6xl font-bold text-slate-300 dark:text-slate-600 mb-4">404</p>
        <h1 className="text-xl font-semibold mb-2">Elemento não encontrado</h1>
        <p className="text-slate-500 dark:text-slate-400 mb-6 text-sm">
          O símbolo ou página que você buscou não existe na tabela periódica.
        </p>
        <Link
          href="/"
          className="px-4 py-2 bg-slate-800 dark:bg-slate-200 text-white dark:text-slate-900 rounded-lg text-sm font-medium hover:opacity-90 focus-visible-ring inline-block"
        >
          Voltar para a tabela
        </Link>
      </div>
    </div>
  )
}
