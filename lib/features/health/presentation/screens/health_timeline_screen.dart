import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/error_boundary.dart';
import '../../domain/entities/health_event_entity.dart';
import '../providers/health_provider.dart';
import '../../domain/usecases/add_health_event_usecase.dart';

class HealthTimelineScreen extends ConsumerWidget {
  const HealthTimelineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(healthTimelineControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timeline de Saúde'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: eventsAsync.when(
        data: (events) {
          if (events.isEmpty) {
            return const Center(child: Text('Sem registros de saúde.'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: events.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final e = events[index];
              return ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                tileColor: Colors.white,
                leading: _iconFor(e.type),
                title: Text(_titleFor(e.type)),
                subtitle: Text(_formatDate(e.date)),
                trailing: e.attachmentUrl != null ? const Icon(Icons.picture_as_pdf_outlined) : null,
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => ErrorBoundary(
          error: err,
          onRetry: () => ref.refresh(healthTimelineControllerProvider),
        ),
      ),
      floatingActionButton: Semantics(
        label: 'Adicionar novo evento de saúde',
        button: true,
        child: FloatingActionButton(
          onPressed: () async {
            final now = DateTime.now();
            await ref.read(healthTimelineControllerProvider.notifier).addEvent(
              AddHealthEventParams(type: HealthEventType.consultation, date: now),
            );
          },
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  Widget _iconFor(HealthEventType t) {
    switch (t) {
      case HealthEventType.vaccine: return const Icon(Icons.vaccines_outlined, color: Colors.green);
      case HealthEventType.exam: return const Icon(Icons.science_outlined, color: Colors.orange);
      case HealthEventType.consultation: return const Icon(Icons.medical_services_outlined, color: Colors.blue);
      case HealthEventType.surgery: return const Icon(Icons.healing_outlined, color: Colors.red);
      case HealthEventType.prescription: return const Icon(Icons.assignment_outlined, color: Colors.purple);
    }
  }

  String _titleFor(HealthEventType t) {
    switch (t) {
      case HealthEventType.vaccine: return 'Vacina';
      case HealthEventType.exam: return 'Exame';
      case HealthEventType.consultation: return 'Consulta';
      case HealthEventType.surgery: return 'Cirurgia';
      case HealthEventType.prescription: return 'Receita';
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
