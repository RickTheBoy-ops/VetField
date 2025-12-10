import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_provider.g.dart';

/// Global cache provider for keeping data alive across widget rebuilds
/// Use ref.keepAlive() in providers that should persist
@Riverpod(keepAlive: true)
class CacheManager extends _$CacheManager {
  final Map<String, DateTime> _cacheTimestamps = {};
  final Duration _defaultTTL = const Duration(minutes: 5);

  @override
  void build() {
    // Initialize cache manager
  }

  /// Check if cached data is still valid
  bool isCacheValid(String key, {Duration? ttl}) {
    final timestamp = _cacheTimestamps[key];
    if (timestamp == null) return false;

    final expiryDuration = ttl ?? _defaultTTL;
    final isExpired = DateTime.now().difference(timestamp) > expiryDuration;

    return !isExpired;
  }

  /// Mark data as cached
  void markCached(String key) {
    _cacheTimestamps[key] = DateTime.now();
  }

  /// Invalidate specific cache
  void invalidate(String key) {
    _cacheTimestamps.remove(key);
  }

  /// Clear all cache
  void clearAll() {
    _cacheTimestamps.clear();
  }
}
