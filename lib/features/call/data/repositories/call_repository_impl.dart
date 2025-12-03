import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/call_repository.dart';
import '../datasources/call_remote_datasource.dart';

class CallRepositoryImpl implements CallRepository {
  final CallRemoteDataSource remote;
  CallRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, String>> startOrJoinCall({
    required String appointmentId,
    required String ownerId,
    required String vetId,
  }) async {
    try {
      final url = await remote.startOrJoinCall(
        appointmentId: appointmentId,
        ownerId: ownerId,
        vetId: vetId,
      );
      return Right(url);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> completeCall({
    required String appointmentId,
  }) async {
    try {
      await remote.completeCall(appointmentId: appointmentId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
