# Adventure Works — dbt

Projeto dbt (Cloud/Core) para modelagem das camadas **stage**, **intermediate** e **marts** a partir de `fea25_05.raw_adventure_works`.

## Estrutura
- `models/stage`: views padronizadas a partir das fontes (`sources`).
- `models/intermediate`: joins e colunas derivadas (ex.: valores líquidos).
- `models/marts`: dimensões e fato de vendas (granularidade: item de pedido).

## Métricas-chave
- **gross_revenue**: ver doc `gross_revenue`.
- **discount_amount**: ver doc `discount_amount`.
- **net_revenue**: ver doc `net_revenue`.
- **ticket_medio (no BI)**: `sum(net_revenue) / count_distinct(sales_order_id)`.

## Rodando
```bash
# construir tudo
dbt build

# só uma camada
dbt run --select stage
dbt run --select intermediate
dbt run --select marts

# testes
dbt test
