import 'package:flutter_test/flutter_test.dart';
import 'package:vetfield_flutter/features/gamification/data/datasources/gamification_local_datasource.dart';

void main() {
  late GamificationLocalDataSourceImpl dataSource;

  setUp(() {
    dataSource = GamificationLocalDataSourceImpl();
  });

  group('GamificationLocalDataSource', () {
    test('should have proper structure for caching profile', () {
      expect(dataSource.cacheProfile, isA<Function>());
      expect(dataSource.getCachedProfile, isA<Function>());
    });

    test('should have clearCache method', () {
      expect(dataSource.clearCache, isA<Function>());
    });
  });
}
