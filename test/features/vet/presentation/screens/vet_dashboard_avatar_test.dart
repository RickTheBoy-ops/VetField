import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vetfield_flutter/features/appointment/domain/entities/appointment_entity.dart';
import 'package:vetfield_flutter/features/appointment/presentation/providers/appointment_provider.dart';
import 'package:vetfield_flutter/features/vet/presentation/screens/vet_dashboard_screen.dart';
import 'package:vetfield_flutter/core/providers/supabase_provider.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}
class MockGoTrueClient extends Mock implements GoTrueClient {}
class MockUser extends Mock implements User {}

void main() {
  testWidgets('Exibe avatar do pet quando petPhotoUrl está presente', (tester) async {
    final supabase = MockSupabaseClient();
    final auth = MockGoTrueClient();
    final user = MockUser();
    when(() => supabase.auth).thenReturn(auth);
    when(() => auth.currentUser).thenReturn(user);
    when(() => user.id).thenReturn('vet_1');

    final appointment = AppointmentEntity(
      id: 'apt_1',
      ownerId: 'owner_1',
      vetId: 'vet_1',
      petId: 'pet_1',
      petName: 'Luna',
      dateTime: DateTime.now().add(const Duration(days: 1)),
      status: AppointmentStatus.confirmed,
      type: AppointmentType.consultation,
      notes: 'Check-up',
      price: 120.0,
      vetName: 'Dr. Vet',
      ownerName: 'Alice',
      petPhotoUrl: 'https://example.com/luna.jpg',
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          supabaseClientProvider.overrideWithValue(supabase),
          vetAppointmentsProvider('vet_1').overrideWith((ref) async => [appointment]),
        ],
        child: const MaterialApp(home: VetDashboardScreen()),
      ),
    );

    await tester.pumpAndSettle();

    final avatars = tester.widgetList<CircleAvatar>(find.byType(CircleAvatar));
    expect(avatars.isNotEmpty, true);

    final hasNetworkImage = avatars.any((a) => a.foregroundImage is NetworkImage);
    expect(hasNetworkImage, true);
  });
}

