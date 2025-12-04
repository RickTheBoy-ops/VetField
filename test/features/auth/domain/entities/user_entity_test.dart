import 'package:flutter_test/flutter_test.dart';
import 'package:vetfield_flutter/features/auth/domain/entities/user_entity.dart';

void main() {
  group('UserEntity', () {
    test('should create user entity with all properties', () {
      const user = UserEntity(
        id: 'test-id-123',
        email: 'test@example.com',
        name: 'Test User',
        type: UserType.owner,
      );

      expect(user.id, 'test-id-123');
      expect(user.email, 'test@example.com');
      expect(user.name, 'Test User');
      expect(user.type, UserType.owner);
    });

    test('should support equality comparison', () {
      const user1 = UserEntity(
        id: '1',
        email: 'test@example.com',
        name: 'Test',
        type: UserType.owner,
      );

      const user2 = UserEntity(
        id: '1',
        email: 'test@example.com',
        name: 'Test',
        type: UserType.owner,
      );

      expect(user1, equals(user2));
    });

    test('should differentiate between owner and vet types', () {
      const owner = UserEntity(
        id: '1',
        email: 'owner@example.com',
        name: 'Owner',
        type: UserType.owner,
      );

      const vet = UserEntity(
        id: '2',
        email: 'vet@example.com',
        name: 'Vet',
        type: UserType.vet,
      );

      expect(owner.type, UserType.owner);
      expect(vet.type, UserType.vet);
      expect(owner, isNot(equals(vet)));
    });
  });
}
