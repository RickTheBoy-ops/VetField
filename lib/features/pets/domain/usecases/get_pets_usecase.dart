import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/pet_entity.dart';
import '../repositories/pet_repository.dart';

class GetPetsUseCase implements UseCase<List<PetEntity>, String> {
  final PetRepository repository;

  GetPetsUseCase(this.repository);

  @override
  Future<Either<Failure, List<PetEntity>>> call(String ownerId) {
    return repository.getPetsByOwner(ownerId);
  }
}

