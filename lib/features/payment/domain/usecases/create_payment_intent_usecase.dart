import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/payment_repository.dart';

class CreatePaymentIntentParams {
  final double amount;
  final String description;

  CreatePaymentIntentParams({
    required this.amount,
    required this.description,
  });
}

class CreatePaymentIntentUseCase
    implements UseCase<String, CreatePaymentIntentParams> {
  final PaymentRepository repository;

  CreatePaymentIntentUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(CreatePaymentIntentParams params) {
    return repository.createPaymentIntent(
      amount: params.amount,
      description: params.description,
    );
  }
}
