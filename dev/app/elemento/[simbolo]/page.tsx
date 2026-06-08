import { supabase } from '@/lib/supabase'
import { notFound } from 'next/navigation'
import Link from 'next/link'
import type { Metadata } from 'next'
import type { Element } from '@/types/element'
import { CATEGORY_COLORS } from '@/lib/categories'

interface Props {
  params: { simbolo: string }
}

async function getElement(simbolo: string): Promise<Element | null> {
  const { data } = await supabase
    .from('elements')
    .select('*')
    .ilike('symbol', simbolo)
    .single()
  return data as Element | null
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const element = await getElement(params.simbolo)
  if (!element) return { title: 'Elemento não encontrado' }
  return {
    title: `${element.name_pt} (${element.symbol})`,
    description: element.description_pt ?? undefined,
  }
}

function Row({ label, value }: { label: string; value: React.ReactNode }) {
  if (!value && value !== 0) return null
  return (
    <div className="flex justify-between gap-4 py-2 border-b border-slate-100 dark:border-slate-700 last:border-0">
      <dt className="text-sm text-slate-500 dark:text-slate-400 flex-shrink-0">{label}</dt>
      <dd className="text-sm font-medium text-right">{value}</dd>
    </div>
  )
}

export default async function ElementPage({ params }: Props) {
  const element = await getElement(params.simbolo)
  if (!element) notFound()

  const colors = CATEGORY_COLORS[element.category]

  return (
    <div className="min-h-screen flex flex-col">
      <header className="sticky top-0 z-10 bg-background/95 backdrop-blur border-b border-slate-200 dark:border-slate-700 px-4 py-3">
        <div className="max-w-2xl mx-auto flex items-center gap-3">
          <Link
            href="/"
            className="text-sm text-slate-500 hover:text-slate-800 dark:hover:text-slate-200 focus-visible-ring rounded"
            aria-label="Voltar para a tabela periódica"
          >
            ← Tabela
          </Link>
          <h1 className="text-lg font-bold">{element.name_pt}</h1>
        </div>
      </header>

      <main id="conteudo-principal" className="flex-1 px-4 py-8 max-w-2xl mx-auto w-full">
        {/* Card de identidade */}
        <div className={`flex gap-6 items-center p-6 rounded-2xl mb-8 ${colors.bg} ${colors.bgDark} ${colors.text} ${colors.textDark}`}>
          <div className="text-center">
            <div className="text-sm opacity-70">{element.number}</div>
            <div className="text-6xl font-bold leading-none">{element.symbol}</div>
            <div className="text-sm mt-1">{element.name_pt}</div>
          </div>
          <div>
            <div className="text-sm font-medium">{CATEGORY_COLORS[element.category].label}</div>
            <div className="text-sm opacity-70">Período {element.period}{element.group_number ? `, Grupo ${element.group_number}` : ''} · Bloco {element.block.toUpperCase()}</div>
            {element.atomic_mass && (
              <div className="text-sm opacity-70">Massa atômica: {element.atomic_mass}</div>
            )}
          </div>
        </div>

        {/* Descrição */}
        {element.description_pt && (
          <p className="text-slate-700 dark:text-slate-300 mb-8 leading-relaxed">
            {element.description_pt}
          </p>
        )}

        {/* Propriedades */}
        <section aria-labelledby="props-heading">
          <h2 id="props-heading" className="font-semibold mb-3">Propriedades</h2>
          <dl className="bg-slate-50 dark:bg-slate-800 rounded-xl px-4">
            <Row label="Estado físico (25°C)" value={element.state_at_room_temp} />
            <Row label="Massa atômica" value={element.atomic_mass ? `${element.atomic_mass} u` : null} />
            <Row label="Densidade" value={element.density ? `${element.density} g/cm³` : null} />
            <Row label="Ponto de fusão" value={element.melting_point ? `${element.melting_point} °C` : null} />
            <Row label="Ponto de ebulição" value={element.boiling_point ? `${element.boiling_point} °C` : null} />
            <Row label="Eletronegatividade" value={element.electronegativity} />
            <Row label="Configuração eletrônica" value={element.electron_config} />
            <Row label="Estados de oxidação" value={element.oxidation_states} />
          </dl>
        </section>

        {/* Histórico */}
        {(element.discovered_by || element.discovery_year) && (
          <section aria-labelledby="hist-heading" className="mt-8">
            <h2 id="hist-heading" className="font-semibold mb-3">Descoberta</h2>
            <dl className="bg-slate-50 dark:bg-slate-800 rounded-xl px-4">
              <Row label="Descoberto por" value={element.discovered_by} />
              <Row label="Ano" value={element.discovery_year} />
            </dl>
          </section>
        )}
      </main>
    </div>
  )
}
