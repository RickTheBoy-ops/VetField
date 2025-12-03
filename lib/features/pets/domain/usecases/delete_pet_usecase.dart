import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/pet_repository.dart';

class DeletePetUseCase implements UseCase<void, DeletePetParams> {
  final PetRepository repository;

  DeletePetUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DeletePetParams params) {
    return repository.deletePet(params.id);
  }
}

class DeletePetParams extends Equatable {
  final String id;

  const DeletePetParams(this.id);

  @override
  List<Object?> get props => [id];
}

