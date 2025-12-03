import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/pet_entity.dart';
import '../entities/pet_entity.dart' as domain;
import '../repositories/pet_repository.dart';

class UpdatePetUseCase implements UseCase<PetEntity, UpdatePetParams> {
  final PetRepository repository;

  UpdatePetUseCase(this.repository);

  @override
  Future<Either<Failure, PetEntity>> call(UpdatePetParams params) {
    final entity = PetEntity(
      id: params.id,
      ownerId: params.ownerId,
      name: params.name,
      breed: params.breed,
      species: params.species,
      gender: params.gender,
      birthDate: params.birthDate,
      weight: params.weight,
      photoUrl: params.photoUrl,
    );
    return repository.updatePet(entity);
  }
}

class UpdatePetParams extends Equatable {
  final String id;
  final String ownerId;
  final String name;
  final String? breed;
  final domain.PetSpecies species;
  final domain.PetGender? gender;
  final DateTime? birthDate;
  final double? weight;
  final String? photoUrl;

  const UpdatePetParams({
    required this.id,
    required this.ownerId,
    required this.name,
    this.breed,
    required this.species,
    this.gender,
    this.birthDate,
    this.weight,
    this.photoUrl,
  });

  @override
  List<Object?> get props => [id, ownerId, name, breed, species, gender, birthDate, weight, photoUrl];
}

