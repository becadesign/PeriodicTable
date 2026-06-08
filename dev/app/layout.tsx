import type { Metadata, Viewport } from 'next'
import localFont from 'next/font/local'
import './globals.css'
import { ThemeProvider } from '@/components/ThemeProvider'

const geistSans = localFont({
  src: './fonts/GeistVF.woff',
  variable: '--font-geist-sans',
  weight: '100 900',
})
const geistMono = localFont({
  src: './fonts/GeistMonoVF.woff',
  variable: '--font-geist-mono',
  weight: '100 900',
})

export const viewport: Viewport = {
  width: 'device-width',
  initialScale: 1,
  // user-scalable não é bloqueado (WCAG 2.5.5)
}

export const metadata: Metadata = {
  manifest: '/manifest.json',
  title: {
    default: 'Tabela Periódica',
    template: '%s | Tabela Periódica',
  },
  description: 'Tabela periódica interativa com todos os 118 elementos químicos em português. Explore propriedades, categorias e curiosidades de cada elemento.',
  keywords: ['tabela periódica', 'elementos químicos', 'química', 'educação'],
  authors: [{ name: 'Bortoli' }],
  icons: { icon: '/icon.svg', apple: '/icon.svg' },
  openGraph: {
    title: 'Tabela Periódica',
    description: 'Tabela periódica interativa com todos os 118 elementos químicos em português.',
    locale: 'pt_BR',
    type: 'website',
  },
}

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode
}>) {
  return (
    <html lang="pt-BR" suppressHydrationWarning>
      <body className={`${geistSans.variable} ${geistMono.variable} antialiased bg-background text-foreground`}>
        <ThemeProvider>
          <a
            href="#conteudo-principal"
            className="sr-only focus:not-sr-only focus:fixed focus:top-2 focus:left-2 focus:z-50 focus:px-4 focus:py-2 focus:bg-blue-600 focus:text-white focus:rounded focus:outline-none"
          >
            Ir para o conteúdo principal
          </a>
          {children}
        </ThemeProvider>
      </body>
    </html>
  )
}
