import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/supabase_provider.dart';
import '../../data/datasources/payment_remote_datasource.dart';
import '../../data/repositories/payment_repository_impl.dart';
import '../../domain/repositories/payment_repository.dart';
import '../../domain/usecases/create_payment_intent_usecase.dart';

part 'payment_provider.g.dart';

@Riverpod(keepAlive: true)
PaymentRemoteDataSource paymentRemoteDataSource(Ref ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return PaymentRemoteDataSourceImpl(supabaseClient);
}

@Riverpod(keepAlive: true)
PaymentRepository paymentRepository(Ref ref) {
  final remoteDataSource = ref.watch(paymentRemoteDataSourceProvider);
  return PaymentRepositoryImpl(remoteDataSource: remoteDataSource);
}

@Riverpod(keepAlive: true)
CreatePaymentIntentUseCase createPaymentIntentUseCase(Ref ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  return CreatePaymentIntentUseCase(repository);
}

@Riverpod(keepAlive: true)
class PaymentController extends _$PaymentController {
  @override
  FutureOr<String?> build() => null;

  Future<void> createPaymentIntent({
    required double amount,
    required String description,
  }) async {
    state = const AsyncValue.loading();
    final useCase = ref.read(createPaymentIntentUseCaseProvider);
    final result = await useCase(
      CreatePaymentIntentParams(amount: amount, description: description),
    );

    result.fold(
      (failure) =>
          state = AsyncValue.error(failure.message, StackTrace.current),
      (clientSecret) => state = AsyncValue.data(clientSecret),
    );
  }
}
