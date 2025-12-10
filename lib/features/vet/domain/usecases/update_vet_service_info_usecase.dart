import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/vet_repository.dart';

class UpdateVetServiceInfoParams {
  final String vetId;
  final String? specialty;
  final double? price;
  final String? address;
  final double? latitude;
  final double? longitude;
  final bool? isAvailable;

  UpdateVetServiceInfoParams({
    required this.vetId,
    this.specialty,
    this.price,
    this.address,
    this.latitude,
    this.longitude,
    this.isAvailable,
  });
}

class UpdateVetServiceInfoUseCase implements UseCase<void, UpdateVetServiceInfoParams> {
  final VetRepository repository;

  UpdateVetServiceInfoUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateVetServiceInfoParams params) async {
    return await repository.updateServiceInfo(
      vetId: params.vetId,
      specialty: params.specialty,
      price: params.price,
      address: params.address,
      latitude: params.latitude,
      longitude: params.longitude,
      isAvailable: params.isAvailable,
    );
  }
}
