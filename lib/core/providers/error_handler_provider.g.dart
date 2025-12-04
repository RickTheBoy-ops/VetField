// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_handler_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$errorHandlerHash() => r'5290f27d7c514037350c84748508b1676ba6d2c3';

/// Global error handler to capture and log async exceptions
///
/// Copied from [ErrorHandler].
@ProviderFor(ErrorHandler)
final errorHandlerProvider =
    AutoDisposeNotifierProvider<ErrorHandler, List<String>>.internal(
      ErrorHandler.new,
      name: r'errorHandlerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$errorHandlerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ErrorHandler = AutoDisposeNotifier<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
