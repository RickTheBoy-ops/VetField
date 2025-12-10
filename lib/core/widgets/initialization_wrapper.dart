import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart'; // Import HiveError
import '../local/hive_boxes.dart';
import '../services/notification_service.dart';
import 'error_screen.dart';
import 'splash_screen.dart';

/// Widget responsável por gerenciar o processo de inicialização do app.
/// Garante que erros críticos sejam capturados e exibidos ao usuário,
/// evitando a tela branca.
class InitializationWrapper extends StatefulWidget {
  final Widget child;

  const InitializationWrapper({super.key, required this.child});

  @override
  State<InitializationWrapper> createState() => _InitializationWrapperState();
}

class _InitializationWrapperState extends State<InitializationWrapper> {
  bool _initialized = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      // 1. Carregar variáveis de ambiente
      try {
        await dotenv.load(fileName: '.env');
      } catch (e) {
        debugPrint(
          'Aviso: Falha ao carregar .env (pode ser esperado na web/prod): $e',
        );
        // Não interrompe se falhar, pois pode ter vars de ambiente do sistema
      }

      // 2. Inicializar Firebase
      try {
        // Tenta inicializar sem options (funciona mobile com google-services.json)
        // Se falhar (web sem options), loga e continua (features firebase ficarão off)
        await Firebase.initializeApp();
        FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler,
        );
      } catch (e) {
        debugPrint('Erro ao inicializar Firebase: $e');
        // Na web, isso é crítico se não tiver options, mas vamos tentar seguir
        // para não travar o app todo se o Firebase não for essencial para o login inicial
      }

      // 3. Configurar Stripe
      final stripeKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'];
      if (stripeKey != null && stripeKey.isNotEmpty) {
        Stripe.publishableKey = stripeKey;
      } else {
        debugPrint('Aviso: STRIPE_PUBLISHABLE_KEY não encontrada.');
      }

      // 4. Inicializar Hive
      try {
        await HiveBoxes.init();
      } catch (e) {
        if (e.toString().contains('NotInitializedError') || e is HiveError) {
          throw Exception(
            'Erro crítico no armazenamento local (Hive): $e. Verifique se o Hive.initFlutter() foi chamado corretamente.',
          );
        }
        rethrow;
      }

      // 5. Inicializar Supabase
      final supabaseUrl = dotenv.env['SUPABASE_URL'];
      final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];

      if (supabaseUrl == null || supabaseAnonKey == null) {
        throw Exception('Configurações do Supabase (URL/KEY) não encontradas.');
      }

      await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);

      // 6. Inicializar NotificationService (depende do Firebase, pode falhar)
      try {
        await NotificationService().initialize();
      } catch (e) {
        debugPrint('Erro ao inicializar NotificationService: $e');
      }

      if (mounted) {
        setState(() {
          _initialized = true;
        });
      }
    } catch (e, stack) {
      debugPrint('Erro fatal na inicialização: $e\n$stack');

      String errorMessage = e.toString();
      // Tenta extrair mensagem mais amigável para NotInitializedError
      if (errorMessage.contains('NotInitializedError')) {
        errorMessage =
            'Erro de Inicialização do Armazenamento Local (Hive).\nDetalhe: $errorMessage';
      }

      if (mounted) {
        setState(() {
          _error = errorMessage;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return ErrorScreen(
        message: 'Falha na inicialização do sistema:\n$_error',
        onRetry: () {
          setState(() {
            _error = null;
            _initialized = false;
          });
          _initialize();
        },
      );
    }

    if (!_initialized) {
      return const SplashScreen();
    }

    return ProviderScope(child: widget.child);
  }
}

// Handler fora da classe para background messages
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("Handling a background message: ${message.messageId}");
}
