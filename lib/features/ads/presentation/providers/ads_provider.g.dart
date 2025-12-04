// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adsRemoteDataSourceHash() =>
    r'b990cd2fed7ae23e2b78cde6b5d9744d38917a6c';

/// See also [adsRemoteDataSource].
@ProviderFor(adsRemoteDataSource)
final adsRemoteDataSourceProvider =
    AutoDisposeProvider<AdsRemoteDataSource>.internal(
  adsRemoteDataSource,
  name: r'adsRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adsRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AdsRemoteDataSourceRef = AutoDisposeProviderRef<AdsRemoteDataSource>;
String _$adsRepositoryHash() => r'012f1b3ca582e719fae515907b9d2385b1d5dd3d';

/// See also [adsRepository].
@ProviderFor(adsRepository)
final adsRepositoryProvider = AutoDisposeProvider<AdsRepository>.internal(
  adsRepository,
  name: r'adsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AdsRepositoryRef = AutoDisposeProviderRef<AdsRepository>;
String _$getActiveCampaignsUseCaseHash() =>
    r'8dca35881816eef77eab2028bd2f5c3b8df7ef81';

/// See also [getActiveCampaignsUseCase].
@ProviderFor(getActiveCampaignsUseCase)
final getActiveCampaignsUseCaseProvider =
    AutoDisposeProvider<GetActiveCampaignsUseCase>.internal(
  getActiveCampaignsUseCase,
  name: r'getActiveCampaignsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getActiveCampaignsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetActiveCampaignsUseCaseRef
    = AutoDisposeProviderRef<GetActiveCampaignsUseCase>;
String _$trackImpressionUseCaseHash() =>
    r'02aaa2f8070ccad33dedff2ba393557b661fbfa9';

/// See also [trackImpressionUseCase].
@ProviderFor(trackImpressionUseCase)
final trackImpressionUseCaseProvider =
    AutoDisposeProvider<TrackImpressionUseCase>.internal(
  trackImpressionUseCase,
  name: r'trackImpressionUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$trackImpressionUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TrackImpressionUseCaseRef
    = AutoDisposeProviderRef<TrackImpressionUseCase>;
String _$trackClickUseCaseHash() => r'c38e4a4fe744a77ac4446aad6f3d200730953cd5';

/// See also [trackClickUseCase].
@ProviderFor(trackClickUseCase)
final trackClickUseCaseProvider =
    AutoDisposeProvider<TrackClickUseCase>.internal(
  trackClickUseCase,
  name: r'trackClickUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$trackClickUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TrackClickUseCaseRef = AutoDisposeProviderRef<TrackClickUseCase>;
String _$activeBannersProviderHash() =>
    r'3788a026c3264542d58a4517f0da37683357fd16';

/// See also [activeBannersProvider].
@ProviderFor(activeBannersProvider)
final activeBannersProviderProvider =
    AutoDisposeFutureProvider<List<CampaignEntity>>.internal(
  activeBannersProvider,
  name: r'activeBannersProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeBannersProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActiveBannersProviderRef
    = AutoDisposeFutureProviderRef<List<CampaignEntity>>;
String _$vetCampaignsProviderHash() =>
    r'e623bc3ccc61db1bde52074c38334dd3bc1e4e94';

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

/// See also [vetCampaignsProvider].
@ProviderFor(vetCampaignsProvider)
const vetCampaignsProviderProvider = VetCampaignsProviderFamily();

/// See also [vetCampaignsProvider].
class VetCampaignsProviderFamily
    extends Family<AsyncValue<List<CampaignEntity>>> {
  /// See also [vetCampaignsProvider].
  const VetCampaignsProviderFamily();

  /// See also [vetCampaignsProvider].
  VetCampaignsProviderProvider call(
    String vetId,
  ) {
    return VetCampaignsProviderProvider(
      vetId,
    );
  }

  @override
  VetCampaignsProviderProvider getProviderOverride(
    covariant VetCampaignsProviderProvider provider,
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
  String? get name => r'vetCampaignsProviderProvider';
}

/// See also [vetCampaignsProvider].
class VetCampaignsProviderProvider
    extends AutoDisposeFutureProvider<List<CampaignEntity>> {
  /// See also [vetCampaignsProvider].
  VetCampaignsProviderProvider(
    String vetId,
  ) : this._internal(
          (ref) => vetCampaignsProvider(
            ref as VetCampaignsProviderRef,
            vetId,
          ),
          from: vetCampaignsProviderProvider,
          name: r'vetCampaignsProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vetCampaignsProviderHash,
          dependencies: VetCampaignsProviderFamily._dependencies,
          allTransitiveDependencies:
              VetCampaignsProviderFamily._allTransitiveDependencies,
          vetId: vetId,
        );

  VetCampaignsProviderProvider._internal(
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
    FutureOr<List<CampaignEntity>> Function(VetCampaignsProviderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VetCampaignsProviderProvider._internal(
        (ref) => create(ref as VetCampaignsProviderRef),
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
  AutoDisposeFutureProviderElement<List<CampaignEntity>> createElement() {
    return _VetCampaignsProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VetCampaignsProviderProvider && other.vetId == vetId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, vetId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VetCampaignsProviderRef
    on AutoDisposeFutureProviderRef<List<CampaignEntity>> {
  /// The parameter `vetId` of this provider.
  String get vetId;
}

class _VetCampaignsProviderProviderElement
    extends AutoDisposeFutureProviderElement<List<CampaignEntity>>
    with VetCampaignsProviderRef {
  _VetCampaignsProviderProviderElement(super.provider);

  @override
  String get vetId => (origin as VetCampaignsProviderProvider).vetId;
}

String _$adTrackingControllerHash() =>
    r'ce423ed25262d45a86d224944c2c82c9fb3c833b';

/// See also [AdTrackingController].
@ProviderFor(AdTrackingController)
final adTrackingControllerProvider =
    AutoDisposeAsyncNotifierProvider<AdTrackingController, void>.internal(
  AdTrackingController.new,
  name: r'adTrackingControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adTrackingControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AdTrackingController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
