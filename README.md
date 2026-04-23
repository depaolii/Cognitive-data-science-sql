# Cognitive Data Science — Projeto SQL: Zoológico com Totem Interativo

Banco de dados relacional modelado até a **3ª Forma Normal (3FN)** para um sistema de zoológico com totem interativo. Desenvolvido como trabalho acadêmico na disciplina de **Cognitive Data Science**, contemplando modelagem conceitual, criação de esquema Oracle SQL, carga de dados de teste, integridade referencial e consultas analíticas.

---

## Sumário

- [Visão Geral](#visão-geral)
- [Objetivo do Trabalho](#objetivo-do-trabalho)
- [O que foi Entregue](#o-que-foi-entregue)
- [Estrutura do Repositório](#estrutura-do-repositório)
- [Modelo de Dados](#modelo-de-dados)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Como Executar](#como-executar)
- [Exemplos de Consultas](#exemplos-de-consultas)
- [Conclusão](#conclusão)

---

## Visão Geral

O projeto modela o banco de dados de um **zoológico com totem interativo**, onde visitantes podem consultar informações sobre animais, espécies e setores diretamente em totens espalhados pelo zoológico. O sistema registra:

- Espécies animais e seus habitats
- Jaulas e seus setores/temperaturas
- Animais e em quais jaulas estão alocados
- Zoológicos e os totens instalados em cada um
- Visitantes, suas visitas e feedbacks sobre a experiência

O banco foi projetado com foco em **integridade referencial** (chaves estrangeiras com `ON DELETE CASCADE`) e **constraints de validação** (valores permitidos para status de limpeza e faixa de temperatura).

---

## Objetivo do Trabalho

O professor solicitou a criação de um banco de dados relacional completo, contemplando:

1. **Modelagem conceitual** — diagrama entidade-relacionamento e normalização até a 3FN
2. **DDL (Data Definition Language)** — criação das tabelas, constraints de integridade (PK, FK, UNIQUE, CHECK) e relacionamentos entre entidades
3. **DML (Data Manipulation Language)** — inserção de dados de teste representativos, além de exemplos de `UPDATE` e `DELETE`
4. **Consultas analíticas (DQL)** — queries `SELECT` que respondam perguntas de negócio relevantes ao domínio do zoológico

---

## O que foi Entregue

| Artefato | Descrição |
|---|---|
| Modelagem (`Modeling.docx`) | Documento com diagrama ER e justificativa das formas normais |
| DDL (`01_DDL.sql`) | 9 tabelas criadas com PKs, FKs, UNIQUEs e CHECKs |
| DML (`dml.sql`) | 23 INSERTs + 1 UPDATE + 1 DELETE com dados de teste |
| DQL (`selects.sql`) | 10 consultas analíticas com JOINs, agregações e filtros |

### Tabelas implementadas

| Tabela | Descrição |
|---|---|
| `especie` | Espécies animais (nome científico, alimentação, habitat) |
| `jaula` | Jaulas/recintos (temperatura, status de limpeza, setor) |
| `animal` | Animais individuais, vinculados à espécie e à jaula |
| `zoologico` | Zoológicos cadastrados (nome, cidade, estado) |
| `totem` | Totens interativos, com localização e vínculo ao zoológico |
| `visitante` | Visitantes (nome, idade, cidade, estado, data de visita) |
| `feedback` | Avaliações dos visitantes (nota de 0 a 10 + comentário) |
| `visitante_zoo` | Tabela associativa: visitante ↔ zoológico |
| `zoo_jaula` | Tabela associativa: zoológico ↔ jaula |

---

## Estrutura do Repositório

```
cognitive-data-science-sql/
│
├── 01_DDL.sql       # Criação das tabelas e constraints (DDL)
├── dml.sql          # Inserção, atualização e exclusão de dados (DML)
├── selects.sql      # Consultas analíticas de negócio (DQL)
├── Modeling.docx    # Documento de modelagem com diagrama ER
└── README.md        # Documentação do projeto
```

---

## Modelo de Dados

```
zoologico ──< zoo_jaula >── jaula ──< animal >── especie
    │
    └──< totem
    │
    └──< visitante_zoo >── visitante ──< feedback
```

**Principais relacionamentos:**
- Um zoológico possui múltiplas jaulas (N:N via `zoo_jaula`)
- Uma jaula abriga múltiplos animais, cada animal pertence a uma espécie
- Um zoológico instala múltiplos totens
- Um visitante pode visitar múltiplos zoológicos (N:N via `visitante_zoo`) e deixar feedbacks

---

## Tecnologias Utilizadas

| Tecnologia | Uso |
|---|---|
| **Oracle SQL** | Dialeto SQL utilizado (sintaxe `VARCHAR2`, `NUMBER`, `DATE '...'`) |
| **SQL DDL** | `CREATE TABLE`, `ALTER TABLE`, constraints de integridade |
| **SQL DML** | `INSERT`, `UPDATE`, `DELETE` |
| **SQL DQL** | `SELECT`, `JOIN`, `GROUP BY`, `AVG`, `COUNT`, `WHERE` |
| **Normalização relacional** | Modelagem até a 3ª Forma Normal (3FN) |

---

## Como Executar

### Pré-requisitos

- Oracle Database (ou Oracle XE gratuito) **ou** qualquer cliente SQL compatível com sintaxe Oracle
- Acesso a uma ferramenta como **SQL*Plus**, **SQL Developer**, **DBeaver** ou **Oracle LiveSQL** (online, sem instalação)

### Passo a Passo

**1. Criar as tabelas (DDL)**

Execute o arquivo `01_DDL.sql` primeiro. Ele cria todas as tabelas e define as constraints:

```sql
-- No SQL*Plus ou SQL Developer, execute:
@01_DDL.sql
```

**2. Inserir os dados de teste (DML)**

Execute o arquivo `dml.sql` para popular as tabelas com dados representativos:

```sql
@dml.sql
```

**3. Executar as consultas analíticas (DQL)**

Execute o arquivo `selects.sql` para rodar as 10 consultas de negócio:

```sql
@selects.sql
```

> **Atenção:** os scripts devem ser executados **nessa ordem** (DDL → DML → DQL), pois as consultas dependem dos dados inseridos.

### Usando Oracle LiveSQL (sem instalação)

1. Acesse [livesql.oracle.com](https://livesql.oracle.com) e crie uma conta gratuita
2. Abra o editor SQL
3. Cole e execute o conteúdo de `01_DDL.sql`
4. Cole e execute o conteúdo de `dml.sql`
5. Cole e execute qualquer consulta de `selects.sql`

---

## Exemplos de Consultas

### Animais com espécie e habitat

```sql
SELECT a.nome AS animal, e.nome_especie, e.habitat
FROM animal a
JOIN especie e ON a.especie_id_especie = e.id_especie;
```

| ANIMAL | NOME_ESPECIE | HABITAT |
|---|---|---|
| Rajah | Tigre-de-Bengala | Floresta Tropical |
| Pingo | Pinguim-Imperador | Regiões Polares |

### Média de satisfação por zoológico

```sql
SELECT z.nome_zoo, AVG(f.nota_experiencia) AS media_nota
FROM feedback f
JOIN visitante_zoo vz ON f.visitante_id_visitante = vz.visitante_id_visitante
JOIN zoologico z ON vz.zoologico_id_zoo = z.id_zoo
GROUP BY z.nome_zoo;
```

| NOME_ZOO | MEDIA_NOTA |
|---|---|
| Zoo São Paulo | 9 |
| Zoo Campinas | 7 |
| Zoo Curitiba | 10 |

### Visitantes com nota de feedback acima de 8

```sql
SELECT v.nome, f.nota_experiencia, f.comentario
FROM visitante v
JOIN feedback f ON v.id_visitante = f.visitante_id_visitante
WHERE f.nota_experiencia > 8;
```

| NOME | NOTA_EXPERIENCIA | COMENTARIO |
|---|---|---|
| Guilherme Silva | 9 | Totem muito fácil de usar! |
| Carlos Mendes | 10 | Experiência incrível! |

---

## Conclusão

O projeto implementou com sucesso um banco de dados relacional completo para o domínio de zoológico com totem interativo. Os principais resultados obtidos foram:

- **Modelo normalizado** até a 3FN, eliminando redundâncias e anomalias de atualização
- **Integridade referencial** garantida via chaves estrangeiras com propagação em cascata
- **Validação de dados** por meio de constraints `CHECK` (status de limpeza e temperatura)
- **10 consultas analíticas** cobrindo JOINs simples e múltiplos, agregações (`COUNT`, `AVG`), filtragem e agrupamento
- **Dados de teste representativos** com 3 zoológicos, 3 espécies, 3 animais, 3 visitantes e 3 totens, além de exemplos de `UPDATE` e `DELETE`

O sistema está pronto para ser estendido com novos módulos, como agendamento de visitas, controle de funcionários ou histórico de manutenção de jaulas.
