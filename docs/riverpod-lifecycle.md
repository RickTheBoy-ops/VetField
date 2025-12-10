# Política de ciclo de vida dos Providers

- Providers usam `@Riverpod(keepAlive: true)` para evitar autoDispose.
- Limpeza de recursos deve ser feita com `ref.onDispose(...)` em controladores.
- Invalidação manual via `ref.invalidate(...)` em eventos de navegação/logout.
- `ProviderCleanupObserver` instala invalidações básicas ao `pop`.
