import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class PaymentRepository {
  Future<Either<Failure, String>> createPaymentIntent({
    required double amount,
    required String description,
  });
}
