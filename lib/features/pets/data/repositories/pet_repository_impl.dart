import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/pet_entity.dart';
import '../../domain/repositories/pet_repository.dart';
import '../datasources/pets_remote_datasource.dart';
import '../models/pet_model.dart';

class PetRepositoryImpl implements PetRepository {
  final PetsRemoteDataSource remote;

  PetRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<PetEntity>>> getPetsByOwner(String ownerId) async {
    try {
      final list = await remote.getPetsByOwner(ownerId);
      return Right(list.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PetEntity>> addPet(PetEntity pet) async {
    try {
      final created = await remote.addPet(PetModel.fromEntity(pet));
      return Right(created.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PetEntity>> updatePet(PetEntity pet) async {
    try {
      final updated = await remote.updatePet(PetModel.fromEntity(pet));
      return Right(updated.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deletePet(String id) async {
    try {
      await remote.deletePet(id);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
