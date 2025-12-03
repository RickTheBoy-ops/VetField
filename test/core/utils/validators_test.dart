import 'package:flutter_test/flutter_test.dart';
import 'package:vetfield_flutter/core/utils/validators.dart';

void main() {
  group('CPF validator', () {
    test('valid CPF', () {
      expect(isValidCpf('52998224725'), true);
      expect(isValidCpf('529.982.247-25'), true);
    });

    test('invalid CPF', () {
      expect(isValidCpf('11111111111'), false);
      expect(isValidCpf('12345678900'), false);
      expect(isValidCpf(''), false);
    });
  });

  group('CRMV validator', () {
    test('valid CRMV', () {
      expect(isValidCrmv('12345-SP'), true);
      expect(isValidCrmv('678901-RJ'), true);
    });

    test('invalid CRMV', () {
      expect(isValidCrmv('12-SP'), false);
      expect(isValidCrmv('12345SP'), false);
      expect(isValidCrmv('12345-123'), false);
    });
  });
}
