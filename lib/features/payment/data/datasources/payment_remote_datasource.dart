import 'package:supabase_flutter/supabase_flutter.dart';

abstract class PaymentRemoteDataSource {
  Future<String> createPaymentIntent({
    required double amount,
    required String description,
  });
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final SupabaseClient supabaseClient;

  PaymentRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<String> createPaymentIntent({
    required double amount,
    required String description,
  }) async {
    final response = await supabaseClient.functions.invoke(
      'create-payment-intent',
      body: {
        'amount': amount,
        'currency': 'brl',
        'description': description,
      },
    );

    if (response.data == null) {
      throw Exception('Failed to create payment intent');
    }

    return response.data['clientSecret'] as String;
  }
}
