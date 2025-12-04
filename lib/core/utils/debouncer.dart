import 'dart:async';
import 'package:flutter/foundation.dart';

/// A debouncer that delays function execution until after [duration] has elapsed
/// since the last time the function was invoked.
/// Useful for search fields to avoid excessive API calls.
class Debouncer {
  final Duration duration;
  Timer? _timer;

  Debouncer({this.duration = const Duration(milliseconds: 500)});

  /// Run the callback after the specified duration
  void run(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(duration, callback);
  }

  /// Cancel any pending callback
  void cancel() {
    _timer?.cancel();
  }

  /// Dispose of the debouncer
  void dispose() {
    _timer?.cancel();
  }
}

/// Extension on Stream to add debounce functionality
extension DebounceExtension<T> on Stream<T> {
  /// Debounce stream events
  /// Note: For proper debouncing in streams, use RxDart's debounceTime operator
  Stream<T> debounce(Duration duration) {
    // Simplified implementation - for production use rxdart debounceTime
    return asyncMap((event) async {
      await Future.delayed(duration);
      return event;
    });
  }
}
