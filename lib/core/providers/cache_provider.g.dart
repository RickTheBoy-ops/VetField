// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cacheManagerHash() => r'4411fc6e6df59b3d982e12c2d3ae8019cecda1b2';

/// Global cache provider for keeping data alive across widget rebuilds
/// Use ref.keepAlive() in providers that should persist
///
/// Copied from [CacheManager].
@ProviderFor(CacheManager)
final cacheManagerProvider = NotifierProvider<CacheManager, void>.internal(
  CacheManager.new,
  name: r'cacheManagerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cacheManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CacheManager = Notifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
