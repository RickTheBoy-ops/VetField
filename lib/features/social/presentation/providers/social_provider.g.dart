// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$socialRemoteDataSourceHash() =>
    r'00fe57c63ffc380a6d65ccb198f62bac9e1cc736';

/// See also [socialRemoteDataSource].
@ProviderFor(socialRemoteDataSource)
final socialRemoteDataSourceProvider =
    Provider<SocialRemoteDataSource>.internal(
  socialRemoteDataSource,
  name: r'socialRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$socialRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SocialRemoteDataSourceRef = ProviderRef<SocialRemoteDataSource>;
String _$socialLocalDataSourceHash() =>
    r'e3f6d62ae8c1b7093268fd6c84437e8243f781b0';

/// See also [socialLocalDataSource].
@ProviderFor(socialLocalDataSource)
final socialLocalDataSourceProvider = Provider<SocialLocalDataSource>.internal(
  socialLocalDataSource,
  name: r'socialLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$socialLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SocialLocalDataSourceRef = ProviderRef<SocialLocalDataSource>;
String _$socialRepositoryHash() => r'8cfca8087972c2b273af352537468ec9a3eaef2f';

/// See also [socialRepository].
@ProviderFor(socialRepository)
final socialRepositoryProvider = Provider<SocialRepository>.internal(
  socialRepository,
  name: r'socialRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$socialRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SocialRepositoryRef = ProviderRef<SocialRepository>;
String _$socialControllerHash() => r'd8ae37b3ef802f3baed6cc66edb1da64cb0b9263';

/// See also [SocialController].
@ProviderFor(SocialController)
final socialControllerProvider =
    AsyncNotifierProvider<SocialController, List<SocialPet>>.internal(
  SocialController.new,
  name: r'socialControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$socialControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SocialController = AsyncNotifier<List<SocialPet>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
