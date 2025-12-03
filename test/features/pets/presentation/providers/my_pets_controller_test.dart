import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vetfield_flutter/features/pets/domain/entities/pet_entity.dart';
import 'package:vetfield_flutter/features/pets/domain/repositories/pet_repository.dart';
import 'package:vetfield_flutter/features/pets/domain/usecases/get_pets_usecase.dart';
import 'package:vetfield_flutter/features/pets/presentation/providers/pets_provider.dart';
import 'package:vetfield_flutter/core/providers/supabase_provider.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}
class MockGoTrueClient extends Mock implements GoTrueClient {}
class MockUser extends Mock implements User {}
class MockPetRepository extends Mock implements PetRepository {}

void main() {
  test('MyPetsController retorna lista de pets do usuário logado', () async {
    final mockSupabase = MockSupabaseClient();
    final mockAuth = MockGoTrueClient();
    final mockUser = MockUser();
    when(() => mockSupabase.auth).thenReturn(mockAuth);
    when(() => mockAuth.currentUser).thenReturn(mockUser);
    when(() => mockUser.id).thenReturn('user_1');

    final pets = [
      const PetEntity(
        id: 'pet_1',
        ownerId: 'user_1',
        name: 'Rex',
        species: PetSpecies.dog,
      ),
      const PetEntity(
        id: 'pet_2',
        ownerId: 'user_1',
        name: 'Mia',
        species: PetSpecies.cat,
      ),
    ];

    final repo = MockPetRepository();
    when(() => repo.getPetsByOwner('user_1')).thenAnswer((_) async => Right(pets));

    final container = ProviderContainer(
      overrides: [
        supabaseClientProvider.overrideWithValue(mockSupabase),
        getPetsUseCaseProvider.overrideWithValue(GetPetsUseCase(repo)),
      ],
    );

    addTearDown(container.dispose);

    final result = await container.read(myPetsControllerProvider.future);
    expect(result.length, 2);
    expect(result.first.name, 'Rex');
    expect(result[1].name, 'Mia');
  });
}
