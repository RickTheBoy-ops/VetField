import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/payment_repository.dart';
import '../datasources/payment_remote_datasource.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;

  PaymentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> createPaymentIntent({
    required double amount,
    required String description,
  }) async {
    try {
      final clientSecret = await remoteDataSource.createPaymentIntent(
        amount: amount,
        description: description,
      );
      return Right(clientSecret);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
