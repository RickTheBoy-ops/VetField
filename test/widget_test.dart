
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vetfield_flutter/main.dart';
import 'package:vetfield_flutter/core/providers/supabase_provider.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

void main() {
  testWidgets('VetField app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // Precisamos sobrescrever o SupabaseClient para não tentar conectar de verdade
    final mockSupabaseClient = MockSupabaseClient();
    
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          supabaseClientProvider.overrideWithValue(mockSupabaseClient),
        ],
        child: const VetFieldApp(),
      ),
    );

    // Verify that app starts (shows Login or Onboarding)
    // O router inicial é /login
    expect(find.text('Entrar'), findsOneWidget);
  });
}
