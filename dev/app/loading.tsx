export default function Loading() {
  return (
    <div className="min-h-screen flex flex-col" aria-busy="true" aria-label="Carregando tabela periódica">
      <header className="border-b border-slate-200 dark:border-slate-700 px-4 py-3">
        <div className="max-w-screen-2xl mx-auto flex items-center justify-between">
          <div>
            <div className="h-5 w-36 bg-slate-200 dark:bg-slate-700 rounded animate-pulse" />
            <div className="h-3 w-24 bg-slate-200 dark:bg-slate-700 rounded animate-pulse mt-1" />
          </div>
          <div className="h-10 w-10 bg-slate-200 dark:bg-slate-700 rounded-lg animate-pulse" />
        </div>
      </header>

      <main className="flex-1 px-4 py-6 max-w-screen-2xl mx-auto w-full">
        {/* Legenda skeleton */}
        <div className="flex flex-wrap gap-1.5 justify-center mb-4">
          {Array.from({ length: 10 }).map((_, i) => (
            <div key={i} className="h-9 w-32 bg-slate-200 dark:bg-slate-700 rounded animate-pulse" />
          ))}
        </div>

        {/* Grid skeleton */}
        <div className="grid grid-cols-18 gap-0.5 min-w-[600px] overflow-x-auto">
          {Array.from({ length: 9 * 18 }).map((_, i) => (
            <div
              key={i}
              className="h-14 bg-slate-200 dark:bg-slate-700 rounded animate-pulse"
              style={{ animationDelay: `${(i % 18) * 30}ms` }}
            />
          ))}
        </div>
      </main>
    </div>
  )
}
