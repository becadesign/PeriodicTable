import type { Config } from 'tailwindcss'

const config: Config = {
  darkMode: 'class',
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        background: 'var(--background)',
        foreground: 'var(--foreground)',
      },
      gridTemplateColumns: {
        'periodic': 'repeat(18, minmax(0, 1fr))',
      },
    },
  },
  plugins: [],
  safelist: [
    { pattern: /^bg-(red|orange|yellow|lime|green|teal|cyan|blue|violet|purple)-(200|900)$/ },
    { pattern: /^text-(red|orange|yellow|lime|green|teal|cyan|blue|violet|purple)-(900|100)$/ },
  ],
}
export default config
