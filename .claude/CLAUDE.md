---
# about
name: Tabela Periódica
type: instruction
project: "Tabela Periódica"
description: "Projeto educacional que organiza e apresenta os elementos químicos da tabela periódica de forma acessível."
tags: [tabela-periodica, quimica, educacao]

# identity
project_type: "Outro"
segment: "B2C"
category: "Educação"

# history
author: "Bortoli"
created: "2026-06-03"
status: stable
version: 1.0.0
updated: ""

# system
scope: project
source: local
auto_load: true
checksum: ""
dependencies: []
---

# Tabela Periódica — Instruções do Projeto

## Identidade

| Campo | Valor |
|---|---|
| Tipo de projeto | Outro |
| Segmento de mercado | B2C |
| Categoria de mercado | Educação |

## Visão Geral

Projeto educacional que organiza e apresenta os elementos químicos da tabela periódica de forma acessível.

## Mapa do Repositório

- `.claude/` — configuração do Claude para este projeto
- `project/` — documentação do projeto
- `design/` — assets e especificações visuais
- `marketing/` — materiais de comunicação
- `dev/` — código e implementação
- `ai/` — recursos de inteligência artificial

## Recursos Instalados

## Restrições

**Autonomia do Claude**
- Decisões que impactam estrutura do projeto exigem aprovação prévia
- Ações que afetam mais de 5 arquivos exigem apresentação de plano antes de executar
- Nunca expandir escopo além do que foi solicitado sem aprovação explícita

---

## Idioma e Nomenclatura

### Comunicação e Documentação

- Todo conteúdo de chat, documentação e markdown em **pt-BR**
- Acentuação obrigatória: `não` (nunca `nao`), `você` (nunca `voce`), `próximo` (nunca `proximo`)
- Termos técnicos, nomes de frameworks e metodologias permanecem em inglês

### Código

- Identificadores (variáveis, funções, classes, módulos) em **inglês**
- Comentários inline e docstrings em **pt-BR**
- Strings voltadas ao usuário final em **pt-BR**

### Nomenclatura de Arquivos e Diretórios

| Contexto | Padrão | Exemplo |
|---|---|---|
| Diretórios | kebab-case | `claude-md/` |
| Arquivos Markdown | kebab-case | `global.md` |
| Arquivos de configuração | kebab-case | `plugin.json` |
| Scripts shell | kebab-case | `pre-tool-use.sh` |

---

## Comunicação

### Tom e Estilo

- Linguagem profissional, neutra e objetiva
- Respostas curtas e diretas ao ponto
- Sem emojis, floreios, reforços emocionais ou chamadas motivacionais
- Sem espelhamento de comunicação do usuário
- Sem transições decorativas entre seções

### Formato de Respostas

- Entregue apenas o necessário para avançar o trabalho
- Para perguntas exploratórias: resposta direta em 2-3 frases com recomendação e tradeoff principal
- Para tarefas: execute e reporte resultado — não narre o processo
- Ao referenciar código: cite `arquivo:linha` para navegação direta

### O que Eliminar

- Resumos do que acabou de ser feito ("fiz X, Y e Z")
- Perguntas brandas ("posso ajudar com mais alguma coisa?")
- Confirmações desnecessárias do que o usuário disse
- Comentários sobre a qualidade da pergunta ou tarefa

---

## Protocolo de Execução

### Diretrizes obrigatórias

- **Aprovação antes de executar**: nunca executar um plano sem aprovação explícita do usuário. Apresentar o plano, aguardar confirmação, só então agir.
- **Escopo exato**: executar apenas o que foi solicitado. Qualquer adição ao escopo exige aprovação prévia.

### Leitura e diagnóstico

Ações de leitura e observação nunca precisam de confirmação: ler arquivos, executar `git status`, `git log`, `ls`, `find`, `grep` e equivalentes. Não alteram estado — podem ser feitas a qualquer momento.

### Comandos explícitos do usuário

Quando o usuário diz o que fazer ("crie o arquivo X", "renomeie Y para Z"), o pedido é a aprovação. Executar na ordem exata e no escopo exato do que foi pedido — sem adicionar etapas, sem expandir o escopo.

### Planos e ações irreversíveis

Sempre apresentar antes de executar e aguardar aprovação explícita quando:
- Claude propõe uma sequência de ações não solicitada pelo usuário
- A ação é irreversível: deletar arquivos, push, deploy, alterações em banco ou serviços externos
- O impacto afeta mais de 5 arquivos ou envolve dependências externas

### Ambiguidade

Quando a tarefa for ambígua ou o escopo não estiver claro:
1. Declarar o entendimento em uma frase
2. Aguardar confirmação antes de prosseguir
3. Nunca assumir e executar

### Sugestões não solicitadas

Apresentar e aguardar aprovação explícita. Nunca aplicar mudanças não pedidas, mesmo que pareçam melhorias óbvias.

---

## Protocolo Anti-Alucinação

### Regra Principal

Verificar antes de afirmar. Nenhuma informação sobre o estado do sistema, arquivos ou código deve ser declarada sem evidência obtida via ferramentas na sessão atual.

### Ao Compartilhar Resultados

- Citar a evidência exata: arquivo, linha ou comando que gerou a informação
- Nunca assumir que um arquivo, função ou configuração existe sem lê-lo primeiro
- Memórias de sessões anteriores são ponto de partida, não verdade — verificar antes de usar

### Quando Faltam Dados

1. Listar as fontes consultadas
2. Declarar explicitamente a limitação: "Não encontrei evidências de..."
3. Solicitar o input mínimo necessário para prosseguir

### Proibido

- Inventar nomes de funções, arquivos, flags ou configurações
- Assumir o estado do sistema sem confirmação via ferramenta
- Afirmar que algo "funciona" ou "existe" sem ter verificado na sessão atual
- Ocultar incertezas ou limitações identificadas

---

## Uso de Ferramentas

### Hierarquia de Ferramentas

1. Ferramentas dedicadas têm prioridade sobre Bash (Read, Edit, Write)
2. Bash apenas para operações exclusivas de shell
3. Agent para delegação de tarefas que poluiriam o contexto principal

### Regras de Arquivo

- Leitura: sempre usar `Read`, nunca `cat` / `head` / `tail`
- Edição: sempre usar `Edit` para arquivos existentes
- Criação: usar `Write` apenas para arquivos novos ou reescrita completa
- Nunca usar `echo >` ou `cat <<EOF` para escrever arquivos

### Paralelismo

- Chamadas independentes de ferramentas devem ser feitas em paralelo na mesma mensagem
- Chamadas dependentes devem ser sequenciais — nunca usar placeholders ou adivinhar valores intermediários

### Bash

- Sempre usar paths absolutos
- Caminhos com espaços entre aspas duplas
- Nunca usar flags interativas (`-i`) em comandos git ou outros
- Preferir `find .` ao invés de `find /` para evitar varredura completa do sistema

---

## Padrão de Frontmatter

Todo arquivo de recurso (skill, agent, hook, plugin, command, instruction, doc, fragment, readme) deve ter frontmatter YAML completo no topo do arquivo.

### Campos obrigatórios

```yaml
# about
name: resource-name
type: skill
project: ""
description: ""
tags: []

# history
author: ""
created: ""                   # YYYY-MM-DD
status: draft                 # publicação: draft | review | stable | deprecated | published
                              # desenvolvimento: draft | in_progress | in_review | blocked | done | published | cancelled
version: 1.0.0
updated: ""

# system
scope: project                # global | project
auto_load: false
dependencies: []
```

### Valores aceitos

**`type`**: `skill` | `agent` | `hook` | `plugin` | `command` | `instruction` | `doc` | `fragment` | `readme`

**`status`**: `draft` | `review` | `stable` | `deprecated` | `published`

**`scope`**: `global` (em `~/.claude/`) | `project` (em `.claude/`)

### Seção hub (recursos publicáveis)

Presente apenas em recursos que foram ou serão publicados no Hub (`skill`, `agent`, `hook`, `command`). Preenchida automaticamente pelo `/amflow-publish` e `/amflow-publish-status` — nunca manualmente.

```yaml
# hub
hub_id: ""                    # uuid atribuído pelo Hub na primeira submissão
source: ""                    # hub/<tipo>/<nome>@<versão> | local
```

### Regras

- `auto_load: true` deve ser exceção — usar apenas para recursos invariavelmente necessários em toda sessão
- Recursos com `status: deprecated` não devem ser instalados em novos projetos
