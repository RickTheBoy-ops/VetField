import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/providers/settings_provider.dart';

void main() async {
  // Configurar orientações permitidas
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await dotenv.load(fileName: ".env");
  final supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  final supabaseAnon = dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  assert(supabaseUrl.isNotEmpty && supabaseAnon.isNotEmpty);
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnon,
  );
  
  runApp(const ProviderScope(child: VetFieldApp()));
}

class VetFieldApp extends ConsumerWidget {
  const VetFieldApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final themeModeAsync = ref.watch(themeControllerProvider);
    final themeMode = themeModeAsync.value ?? ThemeMode.light;

    return MaterialApp.router(
      title: 'VetField',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
