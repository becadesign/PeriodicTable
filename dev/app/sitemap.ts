import type { MetadataRoute } from 'next'
import { supabase } from '@/lib/supabase'

export const dynamic = 'force-dynamic'

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const { data } = await supabase.from('elements').select('symbol').order('number')
  const baseUrl = process.env.NEXT_PUBLIC_BASE_URL ?? 'https://tabela-periodica.vercel.app'

  const elementUrls: MetadataRoute.Sitemap = (data ?? []).map((el) => ({
    url: `${baseUrl}/elemento/${el.symbol.toLowerCase()}`,
    changeFrequency: 'yearly',
    priority: 0.7,
  }))

  return [
    { url: baseUrl, changeFrequency: 'monthly', priority: 1 },
    ...elementUrls,
  ]
}
