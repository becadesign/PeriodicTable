import type { Category } from '@/types/element'

export const CATEGORY_COLORS: Record<Category, { bg: string; bgDark: string; text: string; textDark: string; label: string }> = {
  'metal alcalino':         { bg: 'bg-red-200',    bgDark: 'dark:bg-red-900',    text: 'text-red-900',    textDark: 'dark:text-red-100',    label: 'Metal Alcalino' },
  'metal alcalino-terroso': { bg: 'bg-orange-200', bgDark: 'dark:bg-orange-900', text: 'text-orange-900', textDark: 'dark:text-orange-100', label: 'Metal Alcalino-Terroso' },
  'lantanídeo':             { bg: 'bg-yellow-200', bgDark: 'dark:bg-yellow-900', text: 'text-yellow-900', textDark: 'dark:text-yellow-100', label: 'Lantanídeo' },
  'actinídeo':              { bg: 'bg-lime-200',   bgDark: 'dark:bg-lime-900',   text: 'text-lime-900',   textDark: 'dark:text-lime-100',   label: 'Actinídeo' },
  'metal de transição':     { bg: 'bg-green-200',  bgDark: 'dark:bg-green-900',  text: 'text-green-900',  textDark: 'dark:text-green-100',  label: 'Metal de Transição' },
  'metal pós-transição':    { bg: 'bg-teal-200',   bgDark: 'dark:bg-teal-900',   text: 'text-teal-900',   textDark: 'dark:text-teal-100',   label: 'Metal Pós-Transição' },
  'semimetal':              { bg: 'bg-cyan-200',   bgDark: 'dark:bg-cyan-900',   text: 'text-cyan-900',   textDark: 'dark:text-cyan-100',   label: 'Semimetal' },
  'não-metal':              { bg: 'bg-blue-200',   bgDark: 'dark:bg-blue-900',   text: 'text-blue-900',   textDark: 'dark:text-blue-100',   label: 'Não-Metal' },
  'halogênio':              { bg: 'bg-violet-200', bgDark: 'dark:bg-violet-900', text: 'text-violet-900', textDark: 'dark:text-violet-100', label: 'Halogênio' },
  'gás nobre':              { bg: 'bg-purple-200', bgDark: 'dark:bg-purple-900', text: 'text-purple-900', textDark: 'dark:text-purple-100', label: 'Gás Nobre' },
}

export const CATEGORIES = Object.keys(CATEGORY_COLORS) as Category[]
