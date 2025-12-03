import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/pet_entity.dart';

abstract class PetRepository {
  Future<Either<Failure, List<PetEntity>>> getPetsByOwner(String ownerId);
  Future<Either<Failure, PetEntity>> addPet(PetEntity pet);
  Future<Either<Failure, PetEntity>> updatePet(PetEntity pet);
  Future<Either<Failure, void>> deletePet(String id);
}

