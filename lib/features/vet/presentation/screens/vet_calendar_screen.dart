import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../appointment/presentation/providers/appointment_provider.dart';
import '../../../appointment/domain/entities/appointment_entity.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/providers/supabase_provider.dart';

class VetCalendarScreen extends ConsumerStatefulWidget {
  const VetCalendarScreen({super.key});

  @override
  ConsumerState<VetCalendarScreen> createState() => _VetCalendarScreenState();
}

class _VetCalendarScreenState extends ConsumerState<VetCalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final client = ref.read(supabaseClientProvider);
    final user = client.auth.currentUser;
    final asyncApts = user != null ? ref.watch(vetAppointmentsProvider(user.id)) : const AsyncValue.data(<AppointmentEntity>[]);
    final appointments = asyncApts.value ?? [];

    final eventsByDay = <DateTime, List<AppointmentEntity>>{};
    for (final a in appointments) {
      final key = DateTime(a.dateTime.year, a.dateTime.month, a.dateTime.day);
      eventsByDay.putIfAbsent(key, () => []).add(a);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda do Vet'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: Column(
        children: [
          TableCalendar<AppointmentEntity>(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            eventLoader: (day) => eventsByDay[DateTime(day.year, day.month, day.day)] ?? [],
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                for (final a in eventsByDay[DateTime(_selectedDay!.year, _selectedDay!.month, _selectedDay!.day)] ?? [])
                  ListTile(
                    title: Text('${a.petName} - ${_formatType(a.type)}'),
                    subtitle: Text('${_formatDate(a.dateTime)} - ${_formatStatus(a.status)}'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatType(AppointmentType type) {
    switch (type) {
      case AppointmentType.consultation: return 'Consulta';
      case AppointmentType.vaccine: return 'Vacina';
      case AppointmentType.exam: return 'Exame';
      case AppointmentType.surgery: return 'Cirurgia';
    }
  }

  String _formatStatus(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.pending: return 'Pendente';
      case AppointmentStatus.confirmed: return 'Confirmado';
      case AppointmentStatus.completed: return 'Concluído';
      case AppointmentStatus.cancelled: return 'Cancelado';
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}
