import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/cache_provider.dart';
import '../providers/error_handler_provider.dart';

class ProviderCleanupObserver extends NavigatorObserver {
  final Ref ref;
  ProviderCleanupObserver(this.ref);

  @override
  void didPop(Route route, Route? previousRoute) {
    ref.invalidate(errorHandlerProvider);
    final cache = ref.read(cacheManagerProvider.notifier);
    cache.clearAll();
    super.didPop(route, previousRoute);
  }
}
