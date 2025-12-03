import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/pet_entity.dart';
import '../entities/pet_entity.dart' as domain;
import '../repositories/pet_repository.dart';

class AddPetUseCase implements UseCase<PetEntity, AddPetParams> {
  final PetRepository repository;

  AddPetUseCase(this.repository);

  @override
  Future<Either<Failure, PetEntity>> call(AddPetParams params) {
    final entity = PetEntity(
      id: '',
      ownerId: params.ownerId,
      name: params.name,
      breed: params.breed,
      species: params.species,
      gender: params.gender,
      birthDate: params.birthDate,
      weight: params.weight,
      photoUrl: params.photoUrl,
    );
    return repository.addPet(entity);
  }
}

class AddPetParams extends Equatable {
  final String ownerId;
  final String name;
  final String? breed;
  final domain.PetSpecies species;
  final domain.PetGender? gender;
  final DateTime? birthDate;
  final double? weight;
  final String? photoUrl;

  const AddPetParams({
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
  List<Object?> get props => [ownerId, name, breed, species, gender, birthDate, weight, photoUrl];
}

