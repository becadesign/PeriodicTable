export type Category =
  | 'não-metal'
  | 'gás nobre'
  | 'metal alcalino'
  | 'metal alcalino-terroso'
  | 'semimetal'
  | 'halogênio'
  | 'metal de transição'
  | 'metal pós-transição'
  | 'lantanídeo'
  | 'actinídeo'

export type StateAtRoomTemp = 'sólido' | 'líquido' | 'gasoso' | 'desconhecido'

export interface Element {
  id: number
  number: number
  symbol: string
  name_pt: string
  category: Category
  period: number
  group_number: number | null
  block: string
  atomic_mass: number | null
  density: number | null
  melting_point: number | null
  boiling_point: number | null
  state_at_room_temp: StateAtRoomTemp | null
  electron_config: string | null
  electronegativity: number | null
  oxidation_states: string | null
  discovered_by: string | null
  discovery_year: number | null
  description_pt: string | null
}
