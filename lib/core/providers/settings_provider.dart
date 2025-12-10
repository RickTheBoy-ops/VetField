import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';

part 'settings_provider.g.dart';

const _kThemeModeKey = 'theme_mode';

@Riverpod(keepAlive: true)
FlutterSecureStorage secureStorage(Ref ref) {
  return const FlutterSecureStorage();
}

@Riverpod(keepAlive: true)
class ThemeController extends _$ThemeController {
  @override
  FutureOr<ThemeMode> build() async {
    final storage = ref.read(secureStorageProvider);
    final value = await storage.read(key: _kThemeModeKey);
    switch (value) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

  Future<void> setTheme(ThemeMode mode) async {
    state = AsyncValue.data(mode);
    final storage = ref.read(secureStorageProvider);
    final value = switch (mode) {
      ThemeMode.dark => 'dark',
      ThemeMode.light => 'light',
      ThemeMode.system => 'system',
    };
    await storage.write(key: _kThemeModeKey, value: value);
  }
}
