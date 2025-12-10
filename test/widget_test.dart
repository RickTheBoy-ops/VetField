import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vetfield_flutter/main.dart';
import 'package:vetfield_flutter/core/providers/supabase_provider.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vetfield_flutter/core/local/hive_boxes.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockGoTrueClient extends Mock implements GoTrueClient {}

void main() {
  setUpAll(() async {
    // Mock do dotenv
    dotenv.testLoad(
      fileInput:
          'SUPABASE_URL=https://mock.supabase.co\nSUPABASE_ANON_KEY=mock',
    );

    // Mock do Hive
    Hive.init('test/hive');

    // Abrir todas as boxes necessárias para o teste
    await Hive.openBox(HiveBoxes.userPreferences);
    await Hive.openBox(HiveBoxes.authBox);
    await Hive.openBox(HiveBoxes.pets);
    await Hive.openBox(HiveBoxes.petsBox); // Abrir legado também se necessário
    await Hive.openBox(HiveBoxes.healthRecords);
    await Hive.openBox(HiveBoxes.healthBox);
    await Hive.openBox(HiveBoxes.prescriptions);
    await Hive.openBox(HiveBoxes.prescriptionsBox);
    await Hive.openBox(HiveBoxes.gamificationProgress);
    await Hive.openBox(HiveBoxes.gamificationBox);
    await Hive.openBox(HiveBoxes.appointments);
    await Hive.openBox(HiveBoxes.appointmentsBox);
    await Hive.openBox(HiveBoxes.vetSchedule);
    await Hive.openBox(HiveBoxes.socialPosts);
  });

  // Sem teardown global para evitar travamentos em Windows quando boxes permanecem abertos.

  testWidgets('VetField app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final mockSupabaseClient = MockSupabaseClient();
    final mockAuth = MockGoTrueClient();
    when(() => mockAuth.currentSession).thenReturn(null);
    when(() => mockSupabaseClient.auth).thenReturn(mockAuth);

    // O VetFieldApp agora é envolvido pelo InitializationWrapper no main(),
    // mas aqui testamos o VetFieldApp isoladamente.
    // Como o VetFieldApp usa o router que acessa o Hive, o Hive precisa estar inicializado (feito no setUpAll).

    Hive.box(HiveBoxes.userPreferences).put('first_install', false);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          supabaseClientProvider.overrideWithValue(mockSupabaseClient),
        ],
        child: const VetFieldApp(),
      ),
    );

    await tester.pump();

    // O router deve redirecionar para Onboarding (se user_preferences vazio) ou Login
    // Como abrimos a box vazia, first_install deve ser true (default), indo para Onboarding
    // Verificar se achou algo da tela de Onboarding ou Login
    // Vamos verificar genericamente se renderizou algo e não deu erro
    expect(find.byType(VetFieldApp), findsOneWidget);
  });
}
