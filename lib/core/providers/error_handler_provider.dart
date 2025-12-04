import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'error_handler_provider.g.dart';

/// Global error handler to capture and log async exceptions
@riverpod
class ErrorHandler extends _$ErrorHandler {
  final List<String> _errors = [];

  @override
  List<String> build() {
    return [];
  }

  /// Log an error
  void logError(String error, [StackTrace? stackTrace]) {
    _errors.add(error);
    state = List.from(_errors);

    // In production, send to error tracking service (e.g., Sentry)
    // ignore: avoid_print
    print('ERROR: $error');
    if (stackTrace != null) {
      // ignore: avoid_print
      print('STACK: $stackTrace');
    }
  }

  /// Clear all errors
  void clearErrors() {
    _errors.clear();
    state = [];
  }

  /// Get last error
  String? get lastError => _errors.isEmpty ? null : _errors.last;
}

/// Observer for capturing provider errors globally
class ErrorObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (newValue is AsyncError) {
      final error = newValue.error.toString();
      // Log to error handler
      // In practice, you'd get the errorHandlerProvider from container
      // ignore: avoid_print
      print('Provider Error in ${provider.name ?? provider.runtimeType}: $error');
    }
  }
}
