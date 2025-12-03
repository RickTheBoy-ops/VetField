import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class CallRepository {
  Future<Either<Failure, String>> startOrJoinCall({
    required String appointmentId,
    required String ownerId,
    required String vetId,
  });
  Future<Either<Failure, void>> completeCall({
    required String appointmentId,
  });
}
