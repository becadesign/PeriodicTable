-- Criação da tabela elements
CREATE TABLE IF NOT EXISTS elements (
  id SERIAL PRIMARY KEY,
  number INTEGER NOT NULL UNIQUE,
  symbol VARCHAR(3) NOT NULL UNIQUE,
  name_pt VARCHAR(50) NOT NULL,
  category VARCHAR(50) NOT NULL,
  period INTEGER NOT NULL,
  group_number INTEGER,
  block VARCHAR(1) NOT NULL,
  atomic_mass NUMERIC(10,4),
  density NUMERIC(10,4),
  melting_point NUMERIC(10,2),
  boiling_point NUMERIC(10,2),
  state_at_room_temp VARCHAR(20),
  electron_config VARCHAR(100),
  electronegativity NUMERIC(4,2),
  oxidation_states VARCHAR(50),
  discovered_by VARCHAR(150),
  discovery_year INTEGER,
  description_pt TEXT
);

CREATE INDEX IF NOT EXISTS idx_elements_number ON elements(number);
CREATE INDEX IF NOT EXISTS idx_elements_symbol ON elements(symbol);
CREATE INDEX IF NOT EXISTS idx_elements_category ON elements(category);

ALTER TABLE elements ENABLE ROW LEVEL SECURITY;
CREATE POLICY "leitura_publica" ON elements FOR SELECT USING (true);

-- Inserção dos 118 elementos
INSERT INTO elements (number, symbol, name_pt, category, period, group_number, block, atomic_mass, density, melting_point, boiling_point, state_at_room_temp, electron_config, electronegativity, oxidation_states, discovered_by, discovery_year, description_pt) VALUES

-- Período 1
(1, 'H', 'Hidrogênio', 'não-metal', 1, 1, 's', 1.0080, 0.00009, -259.16, -252.88, 'gasoso', '1s¹', 2.20, '+1, -1', 'Henry Cavendish', 1766, 'Elemento mais leve e abundante do universo. Combustível essencial nas reações de fusão nuclear das estrelas.'),
(2, 'He', 'Hélio', 'gás nobre', 1, 18, 's', 4.0026, 0.000164, -272.20, -268.93, 'gasoso', '1s²', NULL, '0', 'Pierre Janssen, Norman Lockyer', 1868, 'Segundo elemento mais leve, descoberto primeiro no Sol pelo espectro solar. Usado em balões e criogenia.'),

-- Período 2
(3, 'Li', 'Lítio', 'metal alcalino', 2, 1, 's', 6.9410, 0.535, 180.54, 1342.00, 'sólido', '[He] 2s¹', 0.98, '+1', 'Johan August Arfwedson', 1817, 'Metal mais leve, usado em baterias recarregáveis e no tratamento de transtorno bipolar.'),
(4, 'Be', 'Berílio', 'metal alcalino-terroso', 2, 2, 's', 9.0122, 1.848, 1287.00, 2470.00, 'sólido', '[He] 2s²', 1.57, '+2', 'Louis-Nicolas Vauquelin', 1798, 'Metal leve e rígido, usado em componentes aeroespaciais e janelas de raios X.'),
(5, 'B', 'Boro', 'semimetal', 2, 13, 'p', 10.8100, 2.340, 2075.00, 4000.00, 'sólido', '[He] 2s² 2p¹', 2.04, '+3', 'Joseph Louis Gay-Lussac, Louis Jacques Thénard', 1808, 'Semimetal com propriedades únicas, essencial na fabricação de vidro borossilicato e fibras de carbono.'),
(6, 'C', 'Carbono', 'não-metal', 2, 14, 'p', 12.0110, 2.267, 3550.00, 4827.00, 'sólido', '[He] 2s² 2p²', 2.55, '+4, +2, -4', 'Pré-histórico', NULL, 'Base da química orgânica e da vida. Existe em formas alotrópicas como diamante, grafite e fulerenos.'),
(7, 'N', 'Nitrogênio', 'não-metal', 2, 15, 'p', 14.0070, 0.001145, -210.01, -195.79, 'gasoso', '[He] 2s² 2p³', 3.04, '+5, +4, +3, +2, +1, -1, -2, -3', 'Daniel Rutherford', 1772, 'Compõe 78% da atmosfera terrestre. Essencial para proteínas e ácidos nucleicos de todos os seres vivos.'),
(8, 'O', 'Oxigênio', 'não-metal', 2, 16, 'p', 15.9990, 0.001308, -218.79, -182.96, 'gasoso', '[He] 2s² 2p⁴', 3.44, '-2, -1', 'Carl Wilhelm Scheele, Joseph Priestley', 1774, 'Terceiro elemento mais abundante do universo. Fundamental para a respiração e combustão.'),
(9, 'F', 'Flúor', 'halogênio', 2, 17, 'p', 18.9984, 0.001553, -219.67, -188.12, 'gasoso', '[He] 2s² 2p⁵', 3.98, '-1', 'Henri Moissan', 1886, 'Elemento mais eletronegativo. Usado em pasta de dente e na produção de politetrafluoretileno (Teflon).'),
(10, 'Ne', 'Neônio', 'gás nobre', 2, 18, 'p', 20.1800, 0.000825, -248.59, -246.05, 'gasoso', '[He] 2s² 2p⁶', NULL, '0', 'William Ramsay, Morris Travers', 1898, 'Gás nobre com brilho vermelho-alaranjado característico, amplamente usado em letreiros luminosos.'),

-- Período 3
(11, 'Na', 'Sódio', 'metal alcalino', 3, 1, 's', 22.9898, 0.971, 97.72, 882.95, 'sólido', '[Ne] 3s¹', 0.93, '+1', 'Humphry Davy', 1807, 'Metal mole e reativo. Essencial para a função nervosa e muscular; cloreto de sódio é o sal de cozinha.'),
(12, 'Mg', 'Magnésio', 'metal alcalino-terroso', 3, 2, 's', 24.3050, 1.738, 650.00, 1090.00, 'sólido', '[Ne] 3s²', 1.31, '+2', 'Joseph Black', 1755, 'Metal leve usado em ligas de alumínio e como cofator enzimático essencial em organismos vivos.'),
(13, 'Al', 'Alumínio', 'metal pós-transição', 3, 13, 'p', 26.9815, 2.699, 660.32, 2519.00, 'sólido', '[Ne] 3s² 3p¹', 1.61, '+3', 'Hans Christian Ørsted', 1825, 'Metal mais abundante da crosta terrestre. Leve, resistente à corrosão e amplamente reciclável.'),
(14, 'Si', 'Silício', 'semimetal', 3, 14, 'p', 28.0855, 2.329, 1414.00, 3265.00, 'sólido', '[Ne] 3s² 3p²', 1.90, '+4, -4', 'Jöns Jacob Berzelius', 1824, 'Base da eletrônica moderna. Segundo elemento mais abundante da crosta terrestre, usado em semicondutores.'),
(15, 'P', 'Fósforo', 'não-metal', 3, 15, 'p', 30.9738, 1.820, 44.15, 280.50, 'sólido', '[Ne] 3s² 3p³', 2.19, '+5, +3, -3', 'Hennig Brand', 1669, 'Essencial para DNA, RNA e ATP. Componente de fertilizantes e usado em fósforos de segurança.'),
(16, 'S', 'Enxofre', 'não-metal', 3, 16, 'p', 32.0600, 2.067, 115.21, 444.61, 'sólido', '[Ne] 3s² 3p⁴', 2.58, '+6, +4, +2, -2', 'Pré-histórico', NULL, 'Não-metal amarelo conhecido desde a antiguidade. Usado na vulcanização da borracha e produção de ácido sulfúrico.'),
(17, 'Cl', 'Cloro', 'halogênio', 3, 17, 'p', 35.4500, 0.00294, -101.50, -34.04, 'gasoso', '[Ne] 3s² 3p⁵', 3.16, '+7, +5, +3, +1, -1', 'Carl Wilhelm Scheele', 1774, 'Gás amarelo-esverdeado usado em desinfecção de água e produção de PVC e outros compostos industriais.'),
(18, 'Ar', 'Argônio', 'gás nobre', 3, 18, 'p', 39.9480, 0.001633, -189.35, -185.85, 'gasoso', '[Ne] 3s² 3p⁶', NULL, '0', 'Lord Rayleigh, William Ramsay', 1894, 'Gás nobre mais abundante na atmosfera. Usado em lâmpadas fluorescentes e como atmosfera inerte em soldagem.'),

-- Período 4
(19, 'K', 'Potássio', 'metal alcalino', 4, 1, 's', 39.0983, 0.862, 63.38, 759.00, 'sólido', '[Ar] 4s¹', 0.82, '+1', 'Humphry Davy', 1807, 'Metal essencial para a função celular e transmissão nervosa. Principal cátion intracelular nos organismos vivos.'),
(20, 'Ca', 'Cálcio', 'metal alcalino-terroso', 4, 2, 's', 40.0780, 1.550, 842.00, 1484.00, 'sólido', '[Ar] 4s²', 1.00, '+2', 'Humphry Davy', 1808, 'Elemento mais abundante nos ossos e dentes. Essencial para coagulação sanguínea e contração muscular.'),
(21, 'Sc', 'Escândio', 'metal de transição', 4, 3, 'd', 44.9559, 2.985, 1541.00, 2836.00, 'sólido', '[Ar] 3d¹ 4s²', 1.36, '+3', 'Lars Fredrik Nilson', 1879, 'Metal de transição raro usado em ligas de alumínio de alta performance para equipamentos esportivos e aeroespaciais.'),
(22, 'Ti', 'Titânio', 'metal de transição', 4, 4, 'd', 47.8670, 4.507, 1668.00, 3287.00, 'sólido', '[Ar] 3d² 4s²', 1.54, '+4, +3, +2', 'William Gregor', 1791, 'Metal com excepcional resistência e baixo peso. Biocompatível, usado em implantes médicos e aeronaves.'),
(23, 'V', 'Vanádio', 'metal de transição', 4, 5, 'd', 50.9415, 6.110, 1910.00, 3407.00, 'sólido', '[Ar] 3d³ 4s²', 1.63, '+5, +4, +3, +2', 'Andrés Manuel del Río, Nils Gabriel Sefström', 1801, 'Metal duro usado em ligas de aço de alta resistência para ferramentas e construção de turbinas.'),
(24, 'Cr', 'Cromo', 'metal de transição', 4, 6, 'd', 51.9961, 7.190, 1907.00, 2671.00, 'sólido', '[Ar] 3d⁵ 4s¹', 1.66, '+6, +3, +2', 'Louis-Nicolas Vauquelin', 1797, 'Metal brilhante resistente à corrosão, base do aço inoxidável. Responsável pela cor de rubis e esmeraldas.'),
(25, 'Mn', 'Manganês', 'metal de transição', 4, 7, 'd', 54.9380, 7.470, 1246.00, 2061.00, 'sólido', '[Ar] 3d⁵ 4s²', 1.55, '+7, +4, +3, +2', 'Johan Gottlieb Gahn', 1774, 'Metal essencial na produção de aço. Importante cofator enzimático e constituinte da clorofila em plantas.'),
(26, 'Fe', 'Ferro', 'metal de transição', 4, 8, 'd', 55.8450, 7.874, 1538.00, 2861.00, 'sólido', '[Ar] 3d⁶ 4s²', 1.83, '+3, +2', 'Pré-histórico', NULL, 'Metal mais usado pela humanidade, base do aço e do ferro fundido. Transporta oxigênio no sangue pela hemoglobina.'),
(27, 'Co', 'Cobalto', 'metal de transição', 4, 9, 'd', 58.9332, 8.900, 1495.00, 2927.00, 'sólido', '[Ar] 3d⁷ 4s²', 1.88, '+3, +2', 'Georg Brandt', 1735, 'Metal magnético usado em ligas de alta temperatura e baterias de íon-lítio. Componente da vitamina B12.'),
(28, 'Ni', 'Níquel', 'metal de transição', 4, 10, 'd', 58.6934, 8.908, 1455.00, 2913.00, 'sólido', '[Ar] 3d⁸ 4s²', 1.91, '+2, +3', 'Axel Fredrik Cronstedt', 1751, 'Metal resistente à corrosão amplamente usado em ligas, baterias recarregáveis e moedas.'),
(29, 'Cu', 'Cobre', 'metal de transição', 4, 11, 'd', 63.5460, 8.960, 1084.62, 2562.00, 'sólido', '[Ar] 3d¹⁰ 4s¹', 1.90, '+2, +1', 'Pré-histórico', NULL, 'Primeiro metal trabalhado pelo ser humano. Excelente condutor elétrico, usado em fiação e componentes eletrônicos.'),
(30, 'Zn', 'Zinco', 'metal de transição', 4, 12, 'd', 65.3800, 7.133, 419.53, 907.00, 'sólido', '[Ar] 3d¹⁰ 4s²', 1.65, '+2', 'Andreas Sigismund Marggraf', 1746, 'Metal usado na galvanização do aço para proteção contra corrosão. Essencial para o sistema imunológico humano.'),
(31, 'Ga', 'Gálio', 'metal pós-transição', 4, 13, 'p', 69.7230, 5.907, 29.76, 2204.00, 'sólido', '[Ar] 3d¹⁰ 4s² 4p¹', 1.81, '+3', 'Paul Emile Lecoq de Boisbaudran', 1875, 'Metal que derrete na palma da mão (ponto de fusão 30°C). Usado em semicondutores e LEDs de alta eficiência.'),
(32, 'Ge', 'Germânio', 'semimetal', 4, 14, 'p', 72.6300, 5.323, 938.25, 2833.00, 'sólido', '[Ar] 3d¹⁰ 4s² 4p²', 2.01, '+4, +2', 'Clemens Winkler', 1886, 'Semimetal previsto por Mendeleev antes de sua descoberta. Usado em fibras ópticas e transistores de germaneto.'),
(33, 'As', 'Arsênio', 'semimetal', 4, 15, 'p', 74.9216, 5.727, 817.00, 614.00, 'sólido', '[Ar] 3d¹⁰ 4s² 4p³', 2.18, '+5, +3, -3', 'Albertus Magnus', 1250, 'Semimetal tóxico com aplicações em semicondutores de arsenieto de gálio e tratamento de leucemia promielocítica.'),
(34, 'Se', 'Selênio', 'não-metal', 4, 16, 'p', 78.9710, 4.809, 220.80, 685.00, 'sólido', '[Ar] 3d¹⁰ 4s² 4p⁴', 2.55, '+6, +4, -2', 'Jöns Jacob Berzelius', 1817, 'Não-metal essencial em pequenas quantidades para o organismo humano. Usado em células fotovoltaicas e copiadoras.'),
(35, 'Br', 'Bromo', 'halogênio', 4, 17, 'p', 79.9040, 3.122, -7.20, 58.80, 'líquido', '[Ar] 3d¹⁰ 4s² 4p⁵', 2.96, '+5, +3, +1, -1', 'Antoine Jérôme Balard, Carl Jacob Löwig', 1825, 'Único não-metal líquido à temperatura ambiente. Usado em retardantes de chama e pesticidas agrícolas.'),
(36, 'Kr', 'Criptônio', 'gás nobre', 4, 18, 'p', 83.7980, 0.003425, -157.36, -153.22, 'gasoso', '[Ar] 3d¹⁰ 4s² 4p⁶', NULL, '0', 'William Ramsay, Morris Travers', 1898, 'Gás nobre usado em lâmpadas de flash fotográfico de alta intensidade e como padrão de comprimento de onda.'),

-- Período 5
(37, 'Rb', 'Rubídio', 'metal alcalino', 5, 1, 's', 85.4678, 1.532, 39.31, 688.00, 'sólido', '[Kr] 5s¹', 0.82, '+1', 'Robert Bunsen, Gustav Kirchhoff', 1861, 'Metal alcalino altamente reativo. Usado em células fotoelétricas, relógios atômicos e pesquisa em física quântica.'),
(38, 'Sr', 'Estrôncio', 'metal alcalino-terroso', 5, 2, 's', 87.6200, 2.630, 777.00, 1382.00, 'sólido', '[Kr] 5s²', 0.95, '+2', 'Adair Crawford', 1790, 'Metal alcalino-terroso que produz chama vermelha intensa. Usado em fogos de artifício e na datação radiométrica.'),
(39, 'Y', 'Ítrio', 'metal de transição', 5, 3, 'd', 88.9058, 4.472, 1522.00, 3345.00, 'sólido', '[Kr] 4d¹ 5s²', 1.22, '+3', 'Johan Gadolin', 1794, 'Metal de transição usado em ligas de alta resistência, lasers de YAG e supercondutores de alta temperatura.'),
(40, 'Zr', 'Zircônio', 'metal de transição', 5, 4, 'd', 91.2240, 6.511, 1855.00, 4409.00, 'sólido', '[Kr] 4d² 5s²', 1.33, '+4', 'Martin Heinrich Klaproth', 1789, 'Metal resistente à corrosão e à radiação nuclear. Usado em reatores nucleares e implantes dentários de zircônia.'),
(41, 'Nb', 'Nióbio', 'metal de transição', 5, 5, 'd', 92.9064, 8.570, 2477.00, 4744.00, 'sólido', '[Kr] 4d⁴ 5s¹', 1.60, '+5, +3', 'Charles Hatchett', 1801, 'Metal supercondutor a baixas temperaturas. O Brasil possui as maiores reservas mundiais, usado em aço microligado.'),
(42, 'Mo', 'Molibdênio', 'metal de transição', 5, 6, 'd', 95.9600, 10.280, 2623.00, 4639.00, 'sólido', '[Kr] 4d⁵ 5s¹', 2.16, '+6, +4, +3, +2', 'Carl Wilhelm Scheele', 1778, 'Metal refratário com alto ponto de fusão. Usado em aços especiais e como catalisador na indústria química.'),
(43, 'Tc', 'Tecnécio', 'metal de transição', 5, 7, 'd', 98.0000, 11.000, 2157.00, 4265.00, 'sólido', '[Kr] 4d⁵ 5s²', 1.90, '+7, +4', 'Carlo Perrier, Emilio Segrè', 1937, 'Primeiro elemento produzido artificialmente. O isótopo Tc-99m é o mais usado em medicina nuclear diagnóstica.'),
(44, 'Ru', 'Rutênio', 'metal de transição', 5, 8, 'd', 101.0700, 12.370, 2334.00, 4150.00, 'sólido', '[Kr] 4d⁷ 5s¹', 2.20, '+8, +6, +4, +3, +2', 'Karl Ernst Claus', 1844, 'Metal do grupo da platina, duro e resistente à corrosão. Usado em contatos elétricos e como catalisador.'),
(45, 'Rh', 'Ródio', 'metal de transição', 5, 9, 'd', 102.9055, 12.410, 1964.00, 3695.00, 'sólido', '[Kr] 4d⁸ 5s¹', 2.28, '+3, +2', 'William Hyde Wollaston', 1804, 'Metal nobre raro e valioso. Componente essencial de catalisadores de conversores catalíticos automotivos.'),
(46, 'Pd', 'Paládio', 'metal de transição', 5, 10, 'd', 106.4200, 12.023, 1554.90, 2963.00, 'sólido', '[Kr] 4d¹⁰', 2.20, '+4, +2', 'William Hyde Wollaston', 1803, 'Metal nobre com capacidade única de absorver hidrogênio. Usado em catalisadores automotivos e eletrônica.'),
(47, 'Ag', 'Prata', 'metal de transição', 5, 11, 'd', 107.8682, 10.490, 961.78, 2162.00, 'sólido', '[Kr] 4d¹⁰ 5s¹', 1.93, '+1', 'Pré-histórico', NULL, 'Metal nobre com maior condutividade elétrica e térmica de todos os elementos. Usado em joias, fotografia e eletrônica.'),
(48, 'Cd', 'Cádmio', 'metal de transição', 5, 12, 'd', 112.4110, 8.650, 321.07, 767.00, 'sólido', '[Kr] 4d¹⁰ 5s²', 1.69, '+2', 'Friedrich Strohmeyer', 1817, 'Metal tóxico usado em baterias de níquel-cádmio recarregáveis e como pigmento amarelo em tintas industriais.'),
(49, 'In', 'Índio', 'metal pós-transição', 5, 13, 'p', 114.8180, 7.310, 156.60, 2072.00, 'sólido', '[Kr] 4d¹⁰ 5s² 5p¹', 1.78, '+3', 'Ferdinand Reich, Hieronymous Richter', 1863, 'Metal mole usado na fabricação de telas de toque (ITO) e soldas de baixo ponto de fusão.'),
(50, 'Sn', 'Estanho', 'metal pós-transição', 5, 14, 'p', 118.7100, 7.310, 231.93, 2602.00, 'sólido', '[Kr] 4d¹⁰ 5s² 5p²', 1.96, '+4, +2', 'Pré-histórico', NULL, 'Metal maleável usado desde a antiguidade em ligas de bronze. Usado em soldas, latas de conserva e estanhagem.'),
(51, 'Sb', 'Antimônio', 'semimetal', 5, 15, 'p', 121.7600, 6.697, 630.63, 1587.00, 'sólido', '[Kr] 4d¹⁰ 5s² 5p³', 2.05, '+5, +3, -3', 'Pré-histórico', NULL, 'Semimetal usado em ligas de chumbo para baterias e como retardante de chama em plásticos e tecidos.'),
(52, 'Te', 'Telúrio', 'semimetal', 5, 16, 'p', 127.6000, 6.240, 449.51, 988.00, 'sólido', '[Kr] 4d¹⁰ 5s² 5p⁴', 2.10, '+6, +4, -2', 'Franz-Joseph Müller von Reichenstein', 1782, 'Semimetal usado em ligas de aço de corte livre e em células fotovoltaicas de telureto de cádmio.'),
(53, 'I', 'Iodo', 'halogênio', 5, 17, 'p', 126.9045, 4.933, 113.70, 184.30, 'sólido', '[Kr] 4d¹⁰ 5s² 5p⁵', 2.66, '+7, +5, +1, -1', 'Bernard Courtois', 1811, 'Halogênio essencial para a produção de hormônios da tireoide. Usado como antisséptico e em contrastes radiológicos.'),
(54, 'Xe', 'Xenônio', 'gás nobre', 5, 18, 'p', 131.2930, 0.005366, -111.75, -108.12, 'gasoso', '[Kr] 4d¹⁰ 5s² 5p⁶', NULL, '0', 'William Ramsay, Morris Travers', 1898, 'Gás nobre usado em lâmpadas de arco para cinema e faróis automotivos de alta intensidade.'),

-- Período 6
(55, 'Cs', 'Césio', 'metal alcalino', 6, 1, 's', 132.9055, 1.879, 28.44, 671.00, 'sólido', '[Xe] 6s¹', 0.79, '+1', 'Robert Bunsen, Gustav Kirchhoff', 1860, 'Metal alcalino com o ponto de fusão mais baixo entre os metais sólidos. Base dos relógios atômicos modernos.'),
(56, 'Ba', 'Bário', 'metal alcalino-terroso', 6, 2, 's', 137.3270, 3.510, 727.00, 1897.00, 'sólido', '[Xe] 6s²', 0.89, '+2', 'Humphry Davy', 1808, 'Metal alcalino-terroso tóxico. O sulfato de bário é usado como contraste radiopaco em exames digestivos.'),

-- Lantanídeos (período 6, sem grupo padrão)
(57, 'La', 'Lantânio', 'lantanídeo', 6, NULL, 'f', 138.9055, 6.162, 920.00, 3464.00, 'sólido', '[Xe] 5d¹ 6s²', 1.10, '+3', 'Carl Gustaf Mosander', 1839, 'Primeiro lantanídeo, macio e maleável. Usado em ligas para baterias de hidreto metálico de níquel e vidros ópticos.'),
(58, 'Ce', 'Cério', 'lantanídeo', 6, NULL, 'f', 140.1160, 6.770, 798.00, 3443.00, 'sólido', '[Xe] 4f¹ 5d¹ 6s²', 1.12, '+4, +3', 'Martin Heinrich Klaproth, Jöns Jacob Berzelius, Wilhelm Hisinger', 1803, 'Lantanídeo mais abundante, usado em catalisadores de conversores catalíticos e como polimento de vidros ópticos.'),
(59, 'Pr', 'Praseodímio', 'lantanídeo', 6, NULL, 'f', 140.9077, 6.773, 931.00, 3520.00, 'sólido', '[Xe] 4f³ 6s²', 1.13, '+3', 'Carl Auer von Welsbach', 1885, 'Lantanídeo usado em ímãs permanentes de neodímio-ferro-boro e em vidros de proteção para soldadores.'),
(60, 'Nd', 'Neodímio', 'lantanídeo', 6, NULL, 'f', 144.2420, 7.008, 1021.00, 3074.00, 'sólido', '[Xe] 4f⁴ 6s²', 1.14, '+3', 'Carl Auer von Welsbach', 1885, 'Componente dos ímãs permanentes mais fortes conhecidos (Nd₂Fe₁₄B), usados em motores elétricos e geradores eólicos.'),
(61, 'Pm', 'Promécio', 'lantanídeo', 6, NULL, 'f', 145.0000, 7.264, 1042.00, 3000.00, 'sólido', '[Xe] 4f⁵ 6s²', 1.13, '+3', 'Jacob A. Marinsky, Lawrence E. Glendenin, Charles D. Coryell', 1945, 'Único lantanídeo sem isótopos estáveis. Produzido em reatores nucleares, usado em baterias nucleares de baixa potência.'),
(62, 'Sm', 'Samário', 'lantanídeo', 6, NULL, 'f', 150.3600, 7.353, 1072.00, 1794.00, 'sólido', '[Xe] 4f⁶ 6s²', 1.17, '+3, +2', 'Paul Emile Lecoq de Boisbaudran', 1879, 'Lantanídeo usado em ímãs de samário-cobalto, resistentes a altas temperaturas. Aplicado em absorvedores de nêutrons.'),
(63, 'Eu', 'Európio', 'lantanídeo', 6, NULL, 'f', 151.9640, 5.244, 822.00, 1529.00, 'sólido', '[Xe] 4f⁷ 6s²', 1.20, '+3, +2', 'Eugène-Anatole Demarçay', 1901, 'Lantanídeo responsável pela luminescência vermelha e azul em televisores de fósforo e cédulas de euro.'),
(64, 'Gd', 'Gadolínio', 'lantanídeo', 6, NULL, 'f', 157.2500, 7.901, 1313.00, 3273.00, 'sólido', '[Xe] 4f⁷ 5d¹ 6s²', 1.20, '+3', 'Jean Charles Galissard de Marignac', 1880, 'Lantanídeo com propriedades magnéticas excepcionais. Usado como contraste em ressonância magnética e em reatores nucleares.'),
(65, 'Tb', 'Térbio', 'lantanídeo', 6, NULL, 'f', 158.9254, 8.219, 1356.00, 3230.00, 'sólido', '[Xe] 4f⁹ 6s²', 1.20, '+3', 'Carl Gustaf Mosander', 1843, 'Lantanídeo usado em fósforos verdes de telas e em ligas magnetoestrictivas para sensores e atuadores ultrassônicos.'),
(66, 'Dy', 'Disprósio', 'lantanídeo', 6, NULL, 'f', 162.5000, 8.551, 1412.00, 2567.00, 'sólido', '[Xe] 4f¹⁰ 6s²', 1.22, '+3', 'Paul Emile Lecoq de Boisbaudran', 1886, 'Lantanídeo com alta absorção de nêutrons. Adicionado a ímãs de neodímio para manter desempenho em altas temperaturas.'),
(67, 'Ho', 'Hólmio', 'lantanídeo', 6, NULL, 'f', 164.9303, 8.795, 1474.00, 2700.00, 'sólido', '[Xe] 4f¹¹ 6s²', 1.23, '+3', 'Marc Delafontaine, Jacques-Louis Soret', 1878, 'Lantanídeo com o maior momento magnético dos elementos. Usado em lasers médicos e como polo de campo magnético.'),
(68, 'Er', 'Érbio', 'lantanídeo', 6, NULL, 'f', 167.2590, 9.066, 1529.00, 2868.00, 'sólido', '[Xe] 4f¹² 6s²', 1.24, '+3', 'Carl Gustaf Mosander', 1843, 'Lantanídeo que emite luz infravermelha de 1550 nm. Usado em amplificadores de fibra óptica para telecomunicações.'),
(69, 'Tm', 'Túlio', 'lantanídeo', 6, NULL, 'f', 168.9342, 9.321, 1545.00, 1950.00, 'sólido', '[Xe] 4f¹³ 6s²', 1.25, '+3', 'Per Teodor Cleve', 1879, 'Lantanídeo mais raro após o promécio. O isótopo Tm-170 é usado como fonte de raios X portátil em radiografia industrial.'),
(70, 'Yb', 'Itérbio', 'lantanídeo', 6, NULL, 'f', 173.0450, 6.965, 824.00, 1196.00, 'sólido', '[Xe] 4f¹⁴ 6s²', 1.10, '+3, +2', 'Jean Charles Galissard de Marignac', 1878, 'Lantanídeo mole e maleável. Usado nos relógios atômicos de maior precisão e em lasers de estado sólido.'),
(71, 'Lu', 'Lutécio', 'lantanídeo', 6, NULL, 'f', 174.9668, 9.841, 1663.00, 3402.00, 'sólido', '[Xe] 4f¹⁴ 5d¹ 6s²', 1.27, '+3', 'Georges Urbain', 1907, 'Lantanídeo mais denso e duro. Usado em cristais cintiladores para tomografia por emissão de pósitrons (PET).'),

-- Continuação período 6
(72, 'Hf', 'Háfnio', 'metal de transição', 6, 4, 'd', 178.4900, 13.310, 2233.00, 4603.00, 'sólido', '[Xe] 4f¹⁴ 5d² 6s²', 1.30, '+4', 'Dirk Coster, George de Hevesy', 1923, 'Metal refratário com alta absorção de nêutrons. Usado em barras de controle de reatores nucleares e microeletrônica.'),
(73, 'Ta', 'Tântalo', 'metal de transição', 6, 5, 'd', 180.9479, 16.650, 3017.00, 5458.00, 'sólido', '[Xe] 4f¹⁴ 5d³ 6s²', 1.50, '+5', 'Anders Gustav Ekeberg', 1802, 'Metal refratário biocompatível altamente resistente à corrosão. Usado em capacitores eletrônicos e implantes cirúrgicos.'),
(74, 'W', 'Tungstênio', 'metal de transição', 6, 6, 'd', 183.8400, 19.250, 3422.00, 5555.00, 'sólido', '[Xe] 4f¹⁴ 5d⁴ 6s²', 2.36, '+6, +4', 'Juan José Elhuyar, Fausto Elhuyar', 1783, 'Metal com o mais alto ponto de fusão de todos os elementos. Usado em filamentos de lâmpadas e ferramentas de corte.'),
(75, 'Re', 'Rênio', 'metal de transição', 6, 7, 'd', 186.2070, 21.020, 3186.00, 5596.00, 'sólido', '[Xe] 4f¹⁴ 5d⁵ 6s²', 1.90, '+7, +4', 'Masataka Ogawa, Walter Noddack, Ida Tacke', 1925, 'Um dos metais com maior ponto de fusão. Usado em superligas para pás de turbinas a jato e catalisadores de reforma.'),
(76, 'Os', 'Ósmio', 'metal de transição', 6, 8, 'd', 190.2300, 22.590, 3033.00, 5012.00, 'sólido', '[Xe] 4f¹⁴ 5d⁶ 6s²', 2.20, '+8, +4', 'Smithson Tennant', 1803, 'Metal mais denso da natureza. Muito duro e resistente à abrasão, usado em pontas de canetas-tinteiro e instrumentos cirúrgicos.'),
(77, 'Ir', 'Irídio', 'metal de transição', 6, 9, 'd', 192.2170, 22.560, 2446.00, 4428.00, 'sólido', '[Xe] 4f¹⁴ 5d⁷ 6s²', 2.20, '+4, +3', 'Smithson Tennant', 1803, 'Metal mais resistente à corrosão. Anomalia de irídio na rocha marca o impacto do meteorito que extinguiu os dinossauros.'),
(78, 'Pt', 'Platina', 'metal de transição', 6, 10, 'd', 195.0840, 21.450, 1768.30, 3825.00, 'sólido', '[Xe] 4f¹⁴ 5d⁹ 6s¹', 2.28, '+4, +2', 'Antonio de Ulloa', 1735, 'Metal nobre altamente resistente à corrosão. Usado em catalisadores, joias e como padrão internacional de massa.'),
(79, 'Au', 'Ouro', 'metal de transição', 6, 11, 'd', 196.9665, 19.300, 1064.18, 2856.00, 'sólido', '[Xe] 4f¹⁴ 5d¹⁰ 6s¹', 2.54, '+3, +1', 'Pré-histórico', NULL, 'Metal nobre símbolo de riqueza e valor. Excelente condutor, resistente à oxidação, usado em joias e eletrônica.'),
(80, 'Hg', 'Mercúrio', 'metal de transição', 6, 12, 'd', 200.5920, 13.534, -38.83, 356.73, 'líquido', '[Xe] 4f¹⁴ 5d¹⁰ 6s²', 2.00, '+2, +1', 'Pré-histórico', NULL, 'Único metal líquido à temperatura ambiente. Altamente tóxico, usado em termômetros, barômetros e lâmpadas fluorescentes.'),
(81, 'Tl', 'Tálio', 'metal pós-transição', 6, 13, 'p', 204.3833, 11.850, 304.00, 1473.00, 'sólido', '[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p¹', 1.62, '+3, +1', 'William Crookes', 1861, 'Metal mole e tóxico. Usado em detectores de radiação infravermelha e o isótopo Tl-201 em imagens cardíacas nucleares.'),
(82, 'Pb', 'Chumbo', 'metal pós-transição', 6, 14, 'p', 207.2000, 11.340, 327.46, 1749.00, 'sólido', '[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p²', 2.33, '+4, +2', 'Pré-histórico', NULL, 'Metal denso com baixo ponto de fusão, usado desde a antiguidade. Principal uso atual em baterias chumbo-ácido e blindagens.'),
(83, 'Bi', 'Bismuto', 'metal pós-transição', 6, 15, 'p', 208.9804, 9.807, 271.40, 1564.00, 'sólido', '[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p³', 2.02, '+5, +3', 'Claude François Geoffroy', 1753, 'Metal pós-transição com o menor toxicidade entre os metais pesados. Ingrediente ativo do Pepto-Bismol para distúrbios digestivos.'),
(84, 'Po', 'Polônio', 'semimetal', 6, 16, 'p', 209.0000, 9.320, 254.00, 962.00, 'sólido', '[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p⁴', 2.00, '+4, +2', 'Marie Curie, Pierre Curie', 1898, 'Elemento radioativo descoberto por Marie Curie, nomeado em homenagem à Polônia. Usado em dispositivos antistáticos.'),
(85, 'At', 'Ástato', 'halogênio', 6, 17, 'p', 210.0000, 7.000, 302.00, 337.00, 'sólido', '[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p⁵', 2.20, '-1, +1, +3, +5', 'Dale R. Corson, Kenneth Ross MacKenzie, Emilio Segrè', 1940, 'Elemento mais raro encontrado na natureza, com menos de 30 gramas na crosta terrestre. Investigado em radioterapia.'),
(86, 'Rn', 'Radônio', 'gás nobre', 6, 18, 'p', 222.0000, 0.00973, -71.00, -61.70, 'gasoso', '[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p⁶', NULL, '0', 'Friedrich Ernst Dorn', 1900, 'Gás nobre radioativo, produto do decaimento do rádio. Principal causa natural de câncer de pulmão após o tabagismo.'),

-- Período 7
(87, 'Fr', 'Frâncio', 'metal alcalino', 7, 1, 's', 223.0000, 1.870, 27.00, 677.00, 'sólido', '[Rn] 7s¹', 0.70, '+1', 'Marguerite Perey', 1939, 'Metal alcalino mais instável e radioativo. Elemento mais eletropositivo, existe apenas em traços na natureza.'),
(88, 'Ra', 'Rádio', 'metal alcalino-terroso', 7, 2, 's', 226.0000, 5.500, 700.00, 1737.00, 'sólido', '[Rn] 7s²', 0.90, '+2', 'Marie Curie, Pierre Curie', 1898, 'Elemento radioativo descoberto pelos Curies. Historicamente usado em tintas luminescentes e radioterapia do câncer.'),

-- Actinídeos (período 7, sem grupo padrão)
(89, 'Ac', 'Actínio', 'actinídeo', 7, NULL, 'f', 227.0000, 10.070, 1050.00, 3200.00, 'sólido', '[Rn] 6d¹ 7s²', 1.10, '+3', 'André-Louis Debierne', 1899, 'Primeiro actinídeo, altamente radioativo. O isótopo Ac-225 é investigado em terapia de radionuclídeos contra câncer.'),
(90, 'Th', 'Tório', 'actinídeo', 7, NULL, 'f', 232.0377, 11.724, 1750.00, 4788.00, 'sólido', '[Rn] 6d² 7s²', 1.30, '+4', 'Jöns Jacob Berzelius', 1828, 'Actinídeo radioativo, potencial combustível nuclear mais abundante que o urânio. Nomeado em homenagem ao deus Thor.'),
(91, 'Pa', 'Protactínio', 'actinídeo', 7, NULL, 'f', 231.0359, 15.370, 1568.00, 4027.00, 'sólido', '[Rn] 5f² 6d¹ 7s²', 1.50, '+5, +4', 'Kazimierz Fajans, Oswald Helmuth Göhring', 1913, 'Actinídeo radioativo raro e tóxico. O Pa-231 é usado como traçador em estudos de paleoceanografia.'),
(92, 'U', 'Urânio', 'actinídeo', 7, NULL, 'f', 238.0289, 19.050, 1135.00, 4131.00, 'sólido', '[Rn] 5f³ 6d¹ 7s²', 1.38, '+6, +5, +4, +3', 'Martin Heinrich Klaproth', 1789, 'Principal combustível nuclear. O isótopo U-235 é fissível e usado em reatores nucleares e armas atômicas.'),
(93, 'Np', 'Netúnio', 'actinídeo', 7, NULL, 'f', 237.0000, 20.450, 644.00, 4000.00, 'sólido', '[Rn] 5f⁴ 6d¹ 7s²', 1.36, '+5, +4, +3', 'Edwin McMillan, Philip H. Abelson', 1940, 'Primeiro elemento transurânico sintetizado. Subproduto de reatores nucleares, precursor na produção de plutônio.'),
(94, 'Pu', 'Plutônio', 'actinídeo', 7, NULL, 'f', 244.0000, 19.816, 640.00, 3228.00, 'sólido', '[Rn] 5f⁶ 7s²', 1.28, '+6, +5, +4, +3', 'Glenn T. Seaborg, Arthur Wahl, Joseph W. Kennedy, Edwin McMillan', 1940, 'Actinídeo produzido em reatores nucleares. O Pu-239 é usado em armas nucleares e o Pu-238 em geradores termoelétricos.'),
(95, 'Am', 'Amerício', 'actinídeo', 7, NULL, 'f', 243.0000, 13.690, 1176.00, 2011.00, 'sólido', '[Rn] 5f⁷ 7s²', 1.30, '+3', 'Glenn T. Seaborg, Ralph James, Leon Morgan, Albert Ghiorso', 1944, 'Actinídeo sintético presente em detectores de fumaça domésticos. O Am-241 emite partículas alfa para ionizar o ar.'),
(96, 'Cm', 'Cúrio', 'actinídeo', 7, NULL, 'f', 247.0000, 13.510, 1345.00, 3110.00, 'sólido', '[Rn] 5f⁷ 6d¹ 7s²', 1.30, '+3', 'Glenn T. Seaborg, Ralph James, Albert Ghiorso', 1944, 'Actinídeo sintético nomeado em homenagem a Marie e Pierre Curie. Usado como fonte de energia em sondas espaciais.'),
(97, 'Bk', 'Berquélio', 'actinídeo', 7, NULL, 'f', 247.0000, 14.780, 1050.00, NULL, 'sólido', '[Rn] 5f⁹ 7s²', 1.30, '+4, +3', 'Glenn T. Seaborg, Stanley G. Thompson, Albert Ghiorso', 1949, 'Actinídeo sintético nomeado em homenagem a Berkeley, Califórnia. Produzido em quantidades muito pequenas por irradiação nuclear.'),
(98, 'Cf', 'Califórnio', 'actinídeo', 7, NULL, 'f', 251.0000, 15.100, 900.00, NULL, 'sólido', '[Rn] 5f¹⁰ 7s²', 1.30, '+3', 'Glenn T. Seaborg, Stanley G. Thompson, Kenneth Street Jr., Albert Ghiorso', 1950, 'Actinídeo sintético com alta emissão de nêutrons. Usado em aparelhos portáteis para detectar ouro e prata em minérios.'),
(99, 'Es', 'Einstênio', 'actinídeo', 7, NULL, 'f', 252.0000, 8.840, 860.00, NULL, 'sólido', '[Rn] 5f¹¹ 7s²', 1.30, '+3', 'Albert Ghiorso e equipe', 1952, 'Actinídeo sintético descoberto nos detritos da primeira bomba de hidrogênio. Nomeado em homenagem a Albert Einstein.'),
(100, 'Fm', 'Férmio', 'actinídeo', 7, NULL, 'f', 257.0000, NULL, 1527.00, NULL, 'sólido', '[Rn] 5f¹² 7s²', 1.30, '+3', 'Albert Ghiorso e equipe', 1952, 'Actinídeo sintético também descoberto nos detritos da bomba H. Nomeado em homenagem a Enrico Fermi.'),
(101, 'Md', 'Mendelévio', 'actinídeo', 7, NULL, 'f', 258.0000, NULL, 827.00, NULL, 'sólido', '[Rn] 5f¹³ 7s²', 1.30, '+3', 'Albert Ghiorso, Bernard Harvey, Gregory Choppin, Stanley G. Thompson, Glenn T. Seaborg', 1955, 'Actinídeo sintético nomeado em homenagem a Dmitri Mendeleev, criador da tabela periódica.'),
(102, 'No', 'Nobélio', 'actinídeo', 7, NULL, 'f', 259.0000, NULL, 827.00, NULL, 'sólido', '[Rn] 5f¹⁴ 7s²', 1.30, '+2, +3', 'Albert Ghiorso e equipe', 1958, 'Actinídeo sintético nomeado em homenagem a Alfred Nobel. Tem meia-vida máxima de 58 minutos no isótopo No-259.'),
(103, 'Lr', 'Laurêncio', 'actinídeo', 7, NULL, 'f', 266.0000, NULL, 1627.00, NULL, 'sólido', '[Rn] 5f¹⁴ 7s² 7p¹', 1.30, '+3', 'Albert Ghiorso, Torbjørn Sikkeland, Almon Larsh, Robert Latimer', 1961, 'Último actinídeo, nomeado em homenagem a Ernest Lawrence, inventor do cíclotron. Isótopo mais estável tem meia-vida de 11 horas.'),

-- Continuação período 7 (metais de transição superpesados)
(104, 'Rf', 'Rutherfórdio', 'metal de transição', 7, 4, 'd', 267.0000, NULL, NULL, NULL, 'desconhecido', '[Rn] 5f¹⁴ 6d² 7s²', NULL, '+4', 'JINR (Dubna) / LBNL', 1964, 'Primeiro elemento transactinídeo. Nomeado em homenagem a Ernest Rutherford. Isótopo mais estável tem meia-vida de 1,3 hora.'),
(105, 'Db', 'Dúbnio', 'metal de transição', 7, 5, 'd', 268.0000, NULL, NULL, NULL, 'desconhecido', '[Rn] 5f¹⁴ 6d³ 7s²', NULL, '+5', 'JINR (Dubna) / LBNL', 1970, 'Elemento superpesado sintético nomeado em homenagem à cidade de Dubna, Rússia. Meia-vida máxima de 28 horas.'),
(106, 'Sg', 'Seabórgio', 'metal de transição', 7, 6, 'd', 269.0000, NULL, NULL, NULL, 'desconhecido', '[Rn] 5f¹⁴ 6d⁴ 7s²', NULL, '+6', 'LBNL', 1974, 'Elemento superpesado nomeado em homenagem a Glenn T. Seaborg. Isótopo mais estável tem meia-vida de 14 minutos.'),
(107, 'Bh', 'Bóhrio', 'metal de transição', 7, 7, 'd', 270.0000, NULL, NULL, NULL, 'desconhecido', '[Rn] 5f¹⁴ 6d⁵ 7s²', NULL, '+7', 'GSI Darmstadt', 1981, 'Elemento superpesado nomeado em homenagem a Niels Bohr. Comportamento químico similar ao rênio do grupo 7.'),
(108, 'Hs', 'Hássio', 'metal de transição', 7, 8, 'd', 277.0000, NULL, NULL, NULL, 'desconhecido', '[Rn] 5f¹⁴ 6d⁶ 7s²', NULL, '+8', 'GSI Darmstadt', 1984, 'Elemento superpesado nomeado em homenagem ao estado de Hesse, Alemanha. Análogo ao ósmio no grupo 8.'),
(109, 'Mt', 'Meitnério', 'metal de transição', 7, 9, 'd', 278.0000, NULL, NULL, NULL, 'desconhecido', '[Rn] 5f¹⁴ 6d⁷ 7s²', NULL, '+3', 'GSI Darmstadt', 1982, 'Elemento superpesado nomeado em homenagem a Lise Meitner, física pioneira na descoberta da fissão nuclear.'),
(110, 'Ds', 'Darmstádtio', 'metal de transição', 7, 10, 'd', 281.0000, NULL, NULL, NULL, 'desconhecido', '[Rn] 5f¹⁴ 6d⁹ 7s¹', NULL, '+2', 'GSI Darmstadt', 1994, 'Elemento superpesado nomeado em homenagem a Darmstadt, Alemanha. Análogo à platina no grupo 10.'),
(111, 'Rg', 'Roentgênio', 'metal de transição', 7, 11, 'd', 282.0000, NULL, NULL, NULL, 'desconhecido', '[Rn] 5f¹⁴ 6d¹⁰ 7s¹', NULL, '+3', 'GSI Darmstadt', 1994, 'Elemento superpesado nomeado em homenagem a Wilhelm Röntgen, descobridor dos raios X.'),
(112, 'Cn', 'Copernício', 'metal de transição', 7, 12, 'd', 285.0000, NULL, NULL, NULL, 'desconhecido', '[Rn] 5f¹⁴ 6d¹⁰ 7s²', NULL, '+2', 'GSI Darmstadt', 1996, 'Elemento superpesado nomeado em homenagem a Nicolau Copérnico. Previsto como gás nobre pelos efeitos relativísticos.'),
(113, 'Nh', 'Nihônio', 'metal pós-transição', 7, 13, 'p', 286.0000, NULL, NULL, NULL, 'desconhecido', '[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p¹', NULL, '+3', 'RIKEN', 2004, 'Primeiro elemento descoberto na Ásia, no Japão. Nomeado com o nome japonês do Japão (Nihon). Síntese confirmada em 2004.'),
(114, 'Fl', 'Fleróvio', 'metal pós-transição', 7, 14, 'p', 289.0000, NULL, NULL, NULL, 'desconhecido', '[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p²', NULL, '+2', 'JINR (Dubna)', 1999, 'Elemento superpesado nomeado em homenagem ao laboratório Flerov de Dubna. Comportamento mais próximo de gás nobre que do chumbo.'),
(115, 'Mc', 'Moscóvio', 'metal pós-transição', 7, 15, 'p', 290.0000, NULL, NULL, NULL, 'desconhecido', '[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p³', NULL, '+1, +3', 'JINR (Dubna) / LLNL', 2003, 'Elemento superpesado nomeado em homenagem ao Oblast de Moscou, onde fica o laboratório JINR em Dubna.'),
(116, 'Lv', 'Livermório', 'metal pós-transição', 7, 16, 'p', 293.0000, NULL, NULL, NULL, 'desconhecido', '[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p⁴', NULL, '+2', 'JINR (Dubna) / LLNL', 2000, 'Elemento superpesado nomeado em homenagem ao Laboratório Nacional Lawrence Livermore, nos EUA.'),
(117, 'Ts', 'Tenesso', 'halogênio', 7, 17, 'p', 294.0000, NULL, NULL, NULL, 'desconhecido', '[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p⁵', NULL, '-1, +1', 'JINR (Dubna) / ORNL / Vanderbilt / LLNL', 2010, 'Elemento superpesado nomeado em homenagem ao estado do Tennessee, EUA, onde ficam os laboratórios colaboradores.'),
(118, 'Og', 'Oganessônio', 'gás nobre', 7, 18, 'p', 294.0000, NULL, NULL, NULL, 'desconhecido', '[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p⁶', NULL, '0', 'JINR (Dubna) / LLNL', 2002, 'Elemento mais pesado sintetizado, nomeado em homenagem ao físico Yuri Oganessian. Previsto como sólido apesar de ser do grupo 18.');
