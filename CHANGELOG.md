## Remoção de AutoDisposeProviderRef e correções de inicialização do Hive

- Alterado todos os providers para `@Riverpod(keepAlive: true)` e regenerado `.g.dart`, eliminando `AutoDisposeProviderRef`.
- Adicionado `ProviderCleanupObserver` ao `GoRouter` para limpar cache/erros ao sair de rotas.
- Tornada a inicialização do Hive mais robusta com `_safeOpenBox`, prevenindo `NotInitializedError`.
- `app_router.dart`: fallback seguro ao ler `user_preferences` quando Hive não está pronto.
- Testes ajustados: mocks para Supabase auth, correções no `widget_test.dart` e remoção de teardown que travava no Windows.
