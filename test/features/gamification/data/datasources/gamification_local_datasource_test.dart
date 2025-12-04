import 'package:flutter_test/flutter_test.dart';
import 'package:vetfield_flutter/features/gamification/data/datasources/gamification_local_datasource.dart';

void main() {
  late GamificationLocalDataSourceImpl dataSource;

  setUp(() {
    dataSource = GamificationLocalDataSourceImpl();
  });

  group('GamificationLocalDataSource', () {
    test('should have proper structure for caching points', () {
      expect(dataSource.cachePoints, isA<Function>());
      expect(dataSource.getCachedPoints, isA<Function>());
    });

    test('should have proper structure for caching level', () {
      expect(dataSource.cacheLevel, isA<Function>());
      expect(dataSource.getCachedLevel, isA<Function>());
    });

    test('should have proper structure for caching badges', () {
      expect(dataSource.cacheBadges, isA<Function>());
      expect(dataSource.getCachedBadges, isA<Function>());
    });

    test('should have proper structure for caching achievements', () {
      expect(dataSource.cacheAchievements, isA<Function>());
      expect(dataSource.getCachedAchievements, isA<Function>());
    });

    test('should have clearCache method', () {
      expect(dataSource.clearCache, isA<Function>());
    });
  });
}
