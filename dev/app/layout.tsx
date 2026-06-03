import type { Metadata } from 'next'
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

export const metadata: Metadata = {
  title: {
    default: 'Tabela Periódica',
    template: '%s | Tabela Periódica',
  },
  description: 'Tabela periódica interativa com todos os 118 elementos químicos em português. Explore propriedades, categorias e curiosidades de cada elemento.',
  keywords: ['tabela periódica', 'elementos químicos', 'química', 'educação'],
  authors: [{ name: 'Bortoli' }],
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
          {children}
        </ThemeProvider>
      </body>
    </html>
  )
}
