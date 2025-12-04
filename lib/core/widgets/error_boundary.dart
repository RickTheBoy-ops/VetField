import 'package:flutter/material.dart';
import '../error/failures.dart';

/// Global error boundary widget for displaying failures
/// Use this widget to display errors consistently across the app
class ErrorBoundary extends StatelessWidget {
  final Object error;
  final VoidCallback? onRetry;
  final String? customMessage;

  const ErrorBoundary({
    super.key,
    required this.error,
    this.onRetry,
    this.customMessage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Extract user-friendly message from error
    final String message = _getErrorMessage();
    final IconData icon = _getErrorIcon();
    final Color color = _getErrorColor(theme);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 64,
                color: color,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              customMessage ?? message,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _getErrorSubtitle(),
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Tentar Novamente'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _getErrorMessage() {
    if (error is Failure) {
      return (error as Failure).message;
    }
    
    if (error is ServerFailure) {
      return 'Erro no servidor';
    } else if (error is NetworkFailure) {
      return 'Sem conexão com a internet';
    } else if (error is CacheFailure) {
      return 'Erro ao acessar dados locais';
    } else if (error is AuthFailure) {
      return 'Erro de autenticação';
    } else if (error is ValidationFailure) {
      return 'Dados inválidos';
    }

    return 'Algo deu errado';
  }

  String _getErrorSubtitle() {
    if (error is NetworkFailure) {
      return 'Verifique sua conexão e tente novamente';
    } else if (error is ServerFailure) {
      return 'Nossos servidores estão temporariamente indisponíveis';
    } else if (error is AuthFailure) {
      return 'Por favor, faça login novamente';
    } else if (error is CacheFailure) {
      return 'Erro ao acessar dados salvos no dispositivo';
    } else if (error is ValidationFailure) {
      return 'Verifique os dados e tente novamente';
    }
    
    return 'Por favor, tente novamente mais tarde';
  }

  IconData _getErrorIcon() {
    if (error is NetworkFailure) {
      return Icons.wifi_off;
    } else if (error is ServerFailure) {
      return Icons.cloud_off;
    } else if (error is AuthFailure) {
      return Icons.lock_outline;
    } else if (error is CacheFailure) {
      return Icons.storage;
    } else if (error is ValidationFailure) {
      return Icons.error_outline;
    }
    
    return Icons.error_outline;
  }

  Color _getErrorColor(ThemeData theme) {
    if (error is NetworkFailure) {
      return Colors.orange;
    } else if (error is AuthFailure) {
      return Colors.red;
    } else if (error is ValidationFailure) {
      return Colors.amber;
    }
    
    return theme.colorScheme.error;
  }
}
