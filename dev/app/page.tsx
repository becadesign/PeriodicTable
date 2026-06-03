import { supabase } from '@/lib/supabase'
import { PeriodicTable } from '@/components/PeriodicTable'
import { ThemeToggle } from '@/components/ThemeToggle'
import type { Element } from '@/types/element'

export const dynamic = 'force-dynamic'

async function getElements(): Promise<Element[]> {
  const { data, error } = await supabase
    .from('elements')
    .select('*')
    .order('number')

  if (error) throw new Error(error.message)
  return data as Element[]
}

export default async function HomePage() {
  const elements = await getElements()

  return (
    <div className="min-h-screen flex flex-col">
      <header className="sticky top-0 z-10 bg-background/95 backdrop-blur border-b border-slate-200 dark:border-slate-700 px-4 py-3">
        <div className="max-w-screen-2xl mx-auto flex items-center justify-between gap-4">
          <div>
            <h1 className="text-xl font-bold tracking-tight">Tabela Periódica</h1>
            <p className="text-xs text-slate-500 dark:text-slate-400">118 elementos químicos</p>
          </div>
          <ThemeToggle />
        </div>
      </header>

      <main id="conteudo-principal" className="flex-1 px-4 py-6 max-w-screen-2xl mx-auto w-full">
        <PeriodicTable elements={elements} />
      </main>

      <footer className="border-t border-slate-200 dark:border-slate-700 px-4 py-3 text-center text-xs text-slate-400">
        Dados baseados no{' '}
        <a
          href="https://github.com/Bowserinator/Periodic-Table-JSON"
          target="_blank"
          rel="noopener noreferrer"
          className="underline hover:text-slate-600 dark:hover:text-slate-200"
        >
          Periodic Table JSON
        </a>
        {' '}(MIT License)
      </footer>
    </div>
  )
}
