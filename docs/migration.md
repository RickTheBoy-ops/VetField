# Migração para `infinite_scroll_pagination` v5

## Contexto
O projeto utiliza `infinite_scroll_pagination: ^5.1.1`, que introduz mudanças incompatíveis com versões anteriores.

## Principais mudanças aplicadas
- Substituição de `PagingController(firstPageKey: ...)` por `PagingController(getNextPageKey, fetchPage)`.
- Remoção de `addPageRequestListener`, `appendPage`, `appendLastPage` e do setter `error`.
- Atualização de `PagedListView` para receber `state` e `fetchNextPage` via `PagingListener`.

## Impacto de código
- Arquivo: `lib/features/explore/presentation/screens/explore_screen.dart`
  - Controller agora calcula `nextPageKey` e busca páginas via `fetchPage` (mantendo categoria e `pageSize`).
  - UI utiliza `PagingListener` e passa `state`/`fetchNextPage` para a lista.

## Observação
- Mantida a chamada a `refresh()` no filtro de categorias.
- Sem alterações de comportamento funcional na busca de artigos.

## Referências
- Changelog oficial: https://github.com/EdsonBueno/infinite_scroll_pagination/blob/master/CHANGELOG.md
