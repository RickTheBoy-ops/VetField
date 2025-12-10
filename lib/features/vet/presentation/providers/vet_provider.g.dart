// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vet_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vetRemoteDataSourceHash() =>
    r'eedffa8b29c8aa49b8976c54b5bad73523a807eb';

/// See also [vetRemoteDataSource].
@ProviderFor(vetRemoteDataSource)
final vetRemoteDataSourceProvider = Provider<VetRemoteDataSource>.internal(
  vetRemoteDataSource,
  name: r'vetRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vetRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VetRemoteDataSourceRef = ProviderRef<VetRemoteDataSource>;
String _$vetLocalDataSourceHash() =>
    r'e558889cfb79f9f07fee78adc69fc8feda3fe947';

/// See also [vetLocalDataSource].
@ProviderFor(vetLocalDataSource)
final vetLocalDataSourceProvider = Provider<VetLocalDataSource>.internal(
  vetLocalDataSource,
  name: r'vetLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vetLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VetLocalDataSourceRef = ProviderRef<VetLocalDataSource>;
String _$vetRepositoryHash() => r'19411a7dc7342c229f8be5502897e1d7c073e666';

/// See also [vetRepository].
@ProviderFor(vetRepository)
final vetRepositoryProvider = Provider<VetRepository>.internal(
  vetRepository,
  name: r'vetRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vetRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VetRepositoryRef = ProviderRef<VetRepository>;
String _$getVetStatisticsUseCaseHash() =>
    r'ba62bb9a543b6ac5991ef49389b2c53e67c48730';

/// See also [getVetStatisticsUseCase].
@ProviderFor(getVetStatisticsUseCase)
final getVetStatisticsUseCaseProvider =
    Provider<GetVetStatisticsUseCase>.internal(
  getVetStatisticsUseCase,
  name: r'getVetStatisticsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getVetStatisticsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetVetStatisticsUseCaseRef = ProviderRef<GetVetStatisticsUseCase>;
String _$vetStatisticsHash() => r'5e2cacf721a77f925f507ac20b12f2d4957c4a6c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [vetStatistics].
@ProviderFor(vetStatistics)
const vetStatisticsProvider = VetStatisticsFamily();

/// See also [vetStatistics].
class VetStatisticsFamily extends Family<AsyncValue<VetStatistics>> {
  /// See also [vetStatistics].
  const VetStatisticsFamily();

  /// See also [vetStatistics].
  VetStatisticsProvider call(
    String vetId,
  ) {
    return VetStatisticsProvider(
      vetId,
    );
  }

  @override
  VetStatisticsProvider getProviderOverride(
    covariant VetStatisticsProvider provider,
  ) {
    return call(
      provider.vetId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'vetStatisticsProvider';
}

/// See also [vetStatistics].
class VetStatisticsProvider extends FutureProvider<VetStatistics> {
  /// See also [vetStatistics].
  VetStatisticsProvider(
    String vetId,
  ) : this._internal(
          (ref) => vetStatistics(
            ref as VetStatisticsRef,
            vetId,
          ),
          from: vetStatisticsProvider,
          name: r'vetStatisticsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vetStatisticsHash,
          dependencies: VetStatisticsFamily._dependencies,
          allTransitiveDependencies:
              VetStatisticsFamily._allTransitiveDependencies,
          vetId: vetId,
        );

  VetStatisticsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.vetId,
  }) : super.internal();

  final String vetId;

  @override
  Override overrideWith(
    FutureOr<VetStatistics> Function(VetStatisticsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VetStatisticsProvider._internal(
        (ref) => create(ref as VetStatisticsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        vetId: vetId,
      ),
    );
  }

  @override
  FutureProviderElement<VetStatistics> createElement() {
    return _VetStatisticsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VetStatisticsProvider && other.vetId == vetId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, vetId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VetStatisticsRef on FutureProviderRef<VetStatistics> {
  /// The parameter `vetId` of this provider.
  String get vetId;
}

class _VetStatisticsProviderElement extends FutureProviderElement<VetStatistics>
    with VetStatisticsRef {
  _VetStatisticsProviderElement(super.provider);

  @override
  String get vetId => (origin as VetStatisticsProvider).vetId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
