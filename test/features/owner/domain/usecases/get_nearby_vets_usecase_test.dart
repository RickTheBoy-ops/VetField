import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vetfield_flutter/features/owner/domain/entities/vet_entity.dart';
import 'package:vetfield_flutter/features/owner/domain/repositories/vet_repository.dart';
import 'package:vetfield_flutter/features/owner/domain/usecases/get_nearby_vets_usecase.dart';

class MockVetRepository extends Mock implements VetRepository {}

void main() {
  late GetNearbyVetsUseCase usecase;
  late MockVetRepository mockVetRepository;

  setUp(() {
    mockVetRepository = MockVetRepository();
    usecase = GetNearbyVetsUseCase(mockVetRepository);
  });

  const tLat = -23.55;
  const tLong = -46.63;
  const tRadius = 10.0;

  final tVets = [
    const VetEntity(
      id: '1',
      name: 'Dr. Pet',
      specialty: 'General',
      address: 'Rua A',
      rating: 4.5,
      latitude: -23.54,
      longitude: -46.62,
      avatarUrl: 'url',
      price: 100.0,
    ),
  ];

  test('should get list of vets from the repository', () async {
    // Arrange
    when(() => mockVetRepository.getNearbyVets(
          latitude: tLat,
          longitude: tLong,
          radiusKm: tRadius,
        )).thenAnswer((_) async => Right(tVets));

    // Act
    final result = await usecase(const GetNearbyVetsParams(
      latitude: tLat,
      longitude: tLong,
      radiusKm: tRadius,
    ));

    // Assert
    expect(result, Right(tVets));
    verify(() => mockVetRepository.getNearbyVets(
          latitude: tLat,
          longitude: tLong,
          radiusKm: tRadius,
        )).called(1);
    verifyNoMoreInteractions(mockVetRepository);
  });
}
