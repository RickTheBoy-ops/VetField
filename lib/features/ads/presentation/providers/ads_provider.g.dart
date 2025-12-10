// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adsRemoteDataSourceHash() =>
    r'e739f4b2ccd1f6bccd40fad2a885895a1bcdb96d';

/// See also [adsRemoteDataSource].
@ProviderFor(adsRemoteDataSource)
final adsRemoteDataSourceProvider = Provider<AdsRemoteDataSource>.internal(
  adsRemoteDataSource,
  name: r'adsRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adsRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AdsRemoteDataSourceRef = ProviderRef<AdsRemoteDataSource>;
String _$adsRepositoryHash() => r'0118be03d46748d0c1335e478efc768979a253ad';

/// See also [adsRepository].
@ProviderFor(adsRepository)
final adsRepositoryProvider = Provider<AdsRepository>.internal(
  adsRepository,
  name: r'adsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AdsRepositoryRef = ProviderRef<AdsRepository>;
String _$getActiveCampaignsUseCaseHash() =>
    r'b9c398a7ad179bdbcd13cfce82efec4a4a3f060f';

/// See also [getActiveCampaignsUseCase].
@ProviderFor(getActiveCampaignsUseCase)
final getActiveCampaignsUseCaseProvider =
    Provider<GetActiveCampaignsUseCase>.internal(
  getActiveCampaignsUseCase,
  name: r'getActiveCampaignsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getActiveCampaignsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetActiveCampaignsUseCaseRef = ProviderRef<GetActiveCampaignsUseCase>;
String _$trackImpressionUseCaseHash() =>
    r'2bb12871e5258f18857205c2bcf87b0b62b5c347';

/// See also [trackImpressionUseCase].
@ProviderFor(trackImpressionUseCase)
final trackImpressionUseCaseProvider =
    Provider<TrackImpressionUseCase>.internal(
  trackImpressionUseCase,
  name: r'trackImpressionUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$trackImpressionUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TrackImpressionUseCaseRef = ProviderRef<TrackImpressionUseCase>;
String _$trackClickUseCaseHash() => r'f7a02fe7b2a840f7f20740437f5509939904d0dd';

/// See also [trackClickUseCase].
@ProviderFor(trackClickUseCase)
final trackClickUseCaseProvider = Provider<TrackClickUseCase>.internal(
  trackClickUseCase,
  name: r'trackClickUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$trackClickUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TrackClickUseCaseRef = ProviderRef<TrackClickUseCase>;
String _$activeBannersProviderHash() =>
    r'83896aafd101bf63a17b1b7d710acc328a1cfa78';

/// See also [activeBannersProvider].
@ProviderFor(activeBannersProvider)
final activeBannersProviderProvider =
    FutureProvider<List<CampaignEntity>>.internal(
  activeBannersProvider,
  name: r'activeBannersProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeBannersProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActiveBannersProviderRef = FutureProviderRef<List<CampaignEntity>>;
String _$vetCampaignsProviderHash() =>
    r'2e0822c5f2e5760e446a278705f7b61fcb752515';

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
    extends FutureProvider<List<CampaignEntity>> {
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
  FutureProviderElement<List<CampaignEntity>> createElement() {
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

mixin VetCampaignsProviderRef on FutureProviderRef<List<CampaignEntity>> {
  /// The parameter `vetId` of this provider.
  String get vetId;
}

class _VetCampaignsProviderProviderElement
    extends FutureProviderElement<List<CampaignEntity>>
    with VetCampaignsProviderRef {
  _VetCampaignsProviderProviderElement(super.provider);

  @override
  String get vetId => (origin as VetCampaignsProviderProvider).vetId;
}

String _$adTrackingControllerHash() =>
    r'f316a35e9709e7db02e81d5100a448b8d6c938dc';

/// See also [AdTrackingController].
@ProviderFor(AdTrackingController)
final adTrackingControllerProvider =
    AsyncNotifierProvider<AdTrackingController, void>.internal(
  AdTrackingController.new,
  name: r'adTrackingControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adTrackingControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AdTrackingController = AsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
