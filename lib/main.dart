import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/widgets/initialization_wrapper.dart';

void main() {
  // Garante inicialização mínima dos bindings do Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // Configurar ErrorWidget globalmente uma única vez
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                const Text(
                  'Erro de Renderização',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(details.exception.toString(), textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  };

  // Inicia o app imediatamente com o InitializationWrapper
  // Isso evita tela branca enquanto aguarda inicializações assíncronas
  runApp(const InitializationWrapper(child: VetFieldApp()));
}

class VetFieldApp extends ConsumerWidget {
  const VetFieldApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'VetField',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
