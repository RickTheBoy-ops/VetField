import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vetfield_flutter/core/error/failures.dart';
import 'package:vetfield_flutter/features/pets/data/datasources/pets_remote_datasource.dart';
import 'package:vetfield_flutter/features/pets/data/models/pet_model.dart';
import 'package:vetfield_flutter/features/pets/data/repositories/pet_repository_impl.dart';
import 'package:vetfield_flutter/features/pets/domain/entities/pet_entity.dart';

class MockPetsRemoteDataSource extends Mock implements PetsRemoteDataSource {}

void main() {
  late PetRepositoryImpl repository;
  late MockPetsRemoteDataSource mockRemote;
  late PetModel fallbackPetModel;

  setUp(() {
    mockRemote = MockPetsRemoteDataSource();
    repository = PetRepositoryImpl(mockRemote);
    fallbackPetModel = PetModel(
      id: 'fallback',
      ownerId: 'user_fallback',
      name: 'Fallback',
      species: PetSpecies.dog,
    );
  });

  setUpAll(() {
    registerFallbackValue(PetModel(
      id: 'fake',
      ownerId: 'fake_owner',
      name: 'Fake',
      species: PetSpecies.dog,
    ));
  });

  const ownerId = 'user_1';
  final petModel = PetModel(
    id: 'pet_1',
    ownerId: ownerId,
    name: 'Luna',
    breed: 'SRD',
    species: PetSpecies.dog,
    gender: PetGender.female,
    birthDate: DateTime(2022, 5, 20),
    weight: 12.3,
    photoUrl: 'https://example.com/luna.jpg',
  );

  group('getPetsByOwner', () {
    test('deve retornar lista de entidades quando sucesso', () async {
      when(() => mockRemote.getPetsByOwner(ownerId))
          .thenAnswer((_) async => [petModel]);

      final result = await repository.getPetsByOwner(ownerId);

      expect(result.isRight(), true);
      result.fold((_) {}, (list) {
        expect(list.length, 1);
        expect(list.first.name, 'Luna');
        expect(list.first.id, 'pet_1');
      });
    });

    test('deve retornar ServerFailure quando lança exceção', () async {
      when(() => mockRemote.getPetsByOwner(ownerId))
          .thenThrow(Exception('db error'));

      final result = await repository.getPetsByOwner(ownerId);

      expect(result, isA<Left<Failure, List<PetEntity>>>());
    });
  });

  group('add/update/delete', () {
    final entity = petModel.toEntity();

    test('addPet retorna entidade quando sucesso', () async {
      when(() => mockRemote.addPet(any()))
          .thenAnswer((_) async => petModel);

      final result = await repository.addPet(entity);
      expect(result.isRight(), true);
    });

    test('updatePet retorna entidade quando sucesso', () async {
      when(() => mockRemote.updatePet(any()))
          .thenAnswer((_) async => petModel.copyWith(name: 'Luna 2'));

      final result = await repository.updatePet(entity);
      expect(result.isRight(), true);
    });

    test('deletePet retorna Right(null) quando sucesso', () async {
      when(() => mockRemote.deletePet(entity.id))
          .thenAnswer((_) async => Future.value());

      final result = await repository.deletePet(entity.id);
      expect(result.isRight(), true);
    });
  });
}
