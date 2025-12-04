import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vetfield_flutter/core/error/failures.dart';
import 'package:vetfield_flutter/core/widgets/error_boundary.dart';

void main() {
  group('ErrorBoundary Widget', () {
    testWidgets('should display error message for ServerFailure',
        (WidgetTester tester) async {
      // Arrange
      const error = ServerFailure('Server error occurred');

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ErrorBoundary(error: error),
          ),
        ),
      );

      // Assert
      expect(find.text('Erro no servidor'), findsOneWidget);
      expect(
        find.text('Nossos servidores estão temporariamente indisponíveis'),
        findsOneWidget,
      );
    });

    testWidgets('should display error message for NetworkFailure',
        (WidgetTester tester) async {
      // Arrange
      const error = NetworkFailure('No internet connection');

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ErrorBoundary(error: error),
          ),
        ),
      );

      // Assert
      expect(find.text('Sem conexão com a internet'), findsOneWidget);
      expect(
        find.text('Verifique sua conexão e tente novamente'),
        findsOneWidget,
      );
    });

    testWidgets('should display retry button when onRetry is provided',
        (WidgetTester tester) async {
      // Arrange
      const error = ServerFailure('Server error');
      var retryPressed = false;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ErrorBoundary(
              error: error,
              onRetry: () {
                retryPressed = true;
              },
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Tentar Novamente'), findsOneWidget);
      
      // Act - tap retry button
      await tester.tap(find.text('Tentar Novamente'));
      await tester.pump();

      // Assert
      expect(retryPressed, true);
    });

    testWidgets('should not display retry button when onRetry is null',
        (WidgetTester tester) async {
      // Arrange
      const error = ServerFailure('Server error');

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ErrorBoundary(error: error),
          ),
        ),
      );

      // Assert
      expect(find.text('Tentar Novamente'), findsNothing);
    });

    testWidgets('should display custom message when provided',
        (WidgetTester tester) async {
      // Arrange
      const error = ServerFailure('Server error');
      const customMessage = 'Custom error message';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ErrorBoundary(
              error: error,
              customMessage: customMessage,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(customMessage), findsOneWidget);
    });

    testWidgets('should display appropriate icon for NetworkFailure',
        (WidgetTester tester) async {
      // Arrange
      const error = NetworkFailure('No connection');

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ErrorBoundary(error: error),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.wifi_off), findsOneWidget);
    });

    testWidgets('should display appropriate icon for AuthFailure',
        (WidgetTester tester) async {
      // Arrange
      const error = AuthFailure('Authentication failed');

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ErrorBoundary(error: error),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.lock_outline), findsOneWidget);
    });
  });
}
