// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentRemoteDataSourceHash() =>
    r'1d65e7b5032262053c66ecc68769e1fc75adf814';

/// See also [paymentRemoteDataSource].
@ProviderFor(paymentRemoteDataSource)
final paymentRemoteDataSourceProvider =
    Provider<PaymentRemoteDataSource>.internal(
  paymentRemoteDataSource,
  name: r'paymentRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PaymentRemoteDataSourceRef = ProviderRef<PaymentRemoteDataSource>;
String _$paymentRepositoryHash() => r'621d76836b158bda38c4ab8c1ddcb2be76191967';

/// See also [paymentRepository].
@ProviderFor(paymentRepository)
final paymentRepositoryProvider = Provider<PaymentRepository>.internal(
  paymentRepository,
  name: r'paymentRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PaymentRepositoryRef = ProviderRef<PaymentRepository>;
String _$createPaymentIntentUseCaseHash() =>
    r'2e2e0fec48df4413ac6828d0c2a229f1005a363c';

/// See also [createPaymentIntentUseCase].
@ProviderFor(createPaymentIntentUseCase)
final createPaymentIntentUseCaseProvider =
    Provider<CreatePaymentIntentUseCase>.internal(
  createPaymentIntentUseCase,
  name: r'createPaymentIntentUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$createPaymentIntentUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CreatePaymentIntentUseCaseRef = ProviderRef<CreatePaymentIntentUseCase>;
String _$paymentControllerHash() => r'8a485bfc44d744203c49fffb670520d02b591584';

/// See also [PaymentController].
@ProviderFor(PaymentController)
final paymentControllerProvider =
    AsyncNotifierProvider<PaymentController, String?>.internal(
  PaymentController.new,
  name: r'paymentControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PaymentController = AsyncNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
