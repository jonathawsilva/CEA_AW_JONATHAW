# 📊 Projeto de Certificação Indicium — Adventure Works com dbt + Power BI

Este repositório contém todo o pipeline de dados desenvolvido para o desafio técnico da Certificação Indicium, utilizando o **dbt Cloud** para transformação de dados e **Power BI** para construção de dashboards interativos.

---
<<<<<<< HEAD

## 🚀 Visão Geral

- **Fonte de dados**: Banco `raw_adventure_works` no Snowflake.
- **Transformações**: Organizadas em camadas `stage`, `intermediate` e `marts`, utilizando boas práticas do dbt.
- **Modelagem**: Aplicação de testes automáticos, chaves primárias, relacionamento entre dimensões e fato, além de validações com `dbt-utils`.
- **Visualização**: Dashboard criado no Power BI respondendo às perguntas de negócio com filtros dinâmicos e visualizações intuitivas.

---

## 📁 Estrutura do Repositório

├── models/
│ ├── stage/ # Tabelas brutas e renomeadas
│ ├── intermediate/ # Enriquecimentos e joins intermediários
│ └── marts/ # Dimensões e fatos finais
├── macros/
├── snapshots/
├── seeds/
├── dbt_project.yml
├── README.md
└── CERTIFICACAO_INDICIUM.pbix # Arquivo Power BI
=======
>>>>>>> a0457933e9fe1b6174f00d8d5c3f3cb168741b91

## 🚀 Visão Geral

<<<<<<< HEAD
=======
- **Fonte de dados**: Banco `raw_adventure_works` no Snowflake.
- **Transformações**: Organizadas em camadas `stage`, `intermediate` e `marts`, utilizando boas práticas do dbt.
- **Modelagem**: Aplicação de testes automáticos, chaves primárias, relacionamento entre dimensões e fato, além de validações com `dbt-utils`.
- **Visualização**: Dashboard criado no Power BI respondendo às perguntas de negócio com filtros dinâmicos e visualizações intuitivas.

---

## 📁 Estrutura do Repositório

├── models/
│  ── stage/ # Tabelas brutas e renomeadas
│  ── intermediate/ # Enriquecimentos e joins intermediários
│  ── marts/ # Dimensões e fatos finais
│  ── macros/
│  ── snapshots/
│──seeds/
│──dbt_project.yml
│──README.md
│── CERTIFICACAO_INDICIUM.pbix # Arquivo Power BI

>>>>>>> a0457933e9fe1b6174f00d8d5c3f3cb168741b91
---

## 🧱 Camadas dbt

### 🔹 Stage
Responsável por padronizar e renomear colunas das tabelas brutas, além de configurar os testes iniciais (`not_null`, `unique`, `relationships`).

### 🔹 Intermediate
Joins e enriquecimentos para compor as tabelas com contexto de negócio (clientes + pessoas, pedidos + cartões, itens + produtos etc).

### 🔹 Marts
Contém:
- `fact_sales`: fato granular por item de pedido.
- `dim_customers`, `dim_products`, `dim_sales_reason`, `dim_date`, `dim_territory`: dimensões com descrições amigáveis e chaves testadas.

---

## ✅ Testes e Documentação

- Testes implementados com `dbt-utils` e `schema.yml`.
- Testes:
  - `not_null`, `unique`
  - `relationships` (chaves estrangeiras)
- Documentação gerada com `dbt docs generate`.

---

## 📈 Dashboard no Power BI

O arquivo `CERTIFICACAO_INDICIUM.pbix` contém:

### Página 1 – Visão Geral
- Total de pedidos, valor bruto, líquido e descontos.
- Evolução mensal de vendas.
- Análise por produto, cliente e status.

### Página 2 – Clientes
- Clientes ativos.
- Top 10 clientes por receita.
- Distribuição por localidade.

### Página 3 – Produtos
- Produtos com maior ticket médio.
- Comparativo por estado e país.

### Página 4 – Territórios
- Ranking de cidades e regiões com maior faturamento.

### Página 5 – Motivos de Venda (Opcional)
- Análise de impacto dos motivos no total de pedidos e receita.

---

## ⚙️ Como Executar

1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/certificacao-indicium-adventure-works.git
