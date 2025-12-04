// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentRemoteDataSourceHash() =>
    r'34edfd049a0a5494ba9999e249581cc27f7747c2';

/// See also [paymentRemoteDataSource].
@ProviderFor(paymentRemoteDataSource)
final paymentRemoteDataSourceProvider =
    AutoDisposeProvider<PaymentRemoteDataSource>.internal(
      paymentRemoteDataSource,
      name: r'paymentRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$paymentRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PaymentRemoteDataSourceRef =
    AutoDisposeProviderRef<PaymentRemoteDataSource>;
String _$paymentRepositoryHash() => r'edf8c8721e1e8fc559056654f0e3b4f4399d2c45';

/// See also [paymentRepository].
@ProviderFor(paymentRepository)
final paymentRepositoryProvider =
    AutoDisposeProvider<PaymentRepository>.internal(
      paymentRepository,
      name: r'paymentRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$paymentRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PaymentRepositoryRef = AutoDisposeProviderRef<PaymentRepository>;
String _$createPaymentIntentUseCaseHash() =>
    r'239a66d4fc11fc257cdd836ecf01d533e5b1c782';

/// See also [createPaymentIntentUseCase].
@ProviderFor(createPaymentIntentUseCase)
final createPaymentIntentUseCaseProvider =
    AutoDisposeProvider<CreatePaymentIntentUseCase>.internal(
      createPaymentIntentUseCase,
      name: r'createPaymentIntentUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$createPaymentIntentUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CreatePaymentIntentUseCaseRef =
    AutoDisposeProviderRef<CreatePaymentIntentUseCase>;
String _$paymentControllerHash() => r'63ca0be060d59f56c8dafafa9b2df6d5da08ca24';

/// See also [PaymentController].
@ProviderFor(PaymentController)
final paymentControllerProvider =
    AutoDisposeAsyncNotifierProvider<PaymentController, String?>.internal(
      PaymentController.new,
      name: r'paymentControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$paymentControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PaymentController = AutoDisposeAsyncNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
