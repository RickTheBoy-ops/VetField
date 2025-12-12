import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_colors.dart';
import '../../core/providers/supabase_provider.dart';
import '../../features/appointment/presentation/providers/appointment_provider.dart';
import '../../features/appointment/domain/entities/appointment_entity.dart';
import '../../features/call/presentation/providers/call_provider.dart';

class AppointmentsScreen extends ConsumerStatefulWidget {
  const AppointmentsScreen({super.key});
  
  @override
  ConsumerState<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends ConsumerState<AppointmentsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = ref.read(supabaseClientProvider).auth.currentUser;
      if (user != null) {
        ref.read(ownerAppointmentsRealtimeProvider.notifier).subscribe(user.id);
      }
    });
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Meus Tratamentos',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondary,
          indicatorColor: AppColors.primary,
          indicatorWeight: 3,
          tabs: const [
            Tab(text: 'Em Breve'),
            Tab(text: 'Histórico'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildUpcomingTab(),
          _buildHistoryTab(),
        ],
      ),
    );
  }
  
  Widget _buildUpcomingTab() {
    final user = ref.watch(supabaseClientProvider).auth.currentUser;
    if (user == null) {
      return const Center(child: Text('Entre para ver seus agendamentos'));
    }
    final async = ref.watch(ownerAppointmentsProvider(user.id));
    return async.when(
      data: (appointments) {
        final upcoming = appointments.where((a) => a.status != AppointmentStatus.completed && a.status != AppointmentStatus.cancelled).toList();
        if (upcoming.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 64,
                  color: AppColors.textSecondary.withValues(alpha: 0.3),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Nenhum agendamento futuro',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Seus próximos tratamentos aparecerão aqui.',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(24),
          itemCount: upcoming.length,
          itemBuilder: (context, i) {
            final a = upcoming[i];
            return _buildAppointmentCard(
              _formatType(a.type),
              a.vetName ?? 'Veterinário',
              _formatDateOnly(a.dateTime),
              _formatTime(a.dateTime),
              a.status.name,
              appointment: a,
            );
          },
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
      error: (e, stack) {
        debugPrint('Erro appointments: $e');
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: AppColors.error),
                const SizedBox(height: 16),
                const Text(
                  'Não foi possível carregar seus agendamentos.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () => ref.refresh(ownerAppointmentsProvider(user.id)),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Tentar Novamente'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  
  Widget _buildHistoryTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildAppointmentCard(
          'Vacinação',
          'Clínica Vet Center',
          '10 Dez, 2024',
          '10:00',
          'completed',
        ),
        const SizedBox(height: 16),
        _buildAppointmentCard(
          'Consulta Dermatológica',
          'Hospital Vet 24h',
          '05 Dez, 2024',
          '15:30',
          'completed',
        ),
      ],
    );
  }
  
  Widget _buildAppointmentCard(
    String service,
    String clinic,
    String date,
    String time,
    String status, {
    AppointmentEntity? appointment,
  }) {
    Color statusColor;
    String statusText;
    IconData statusIcon;
    
    switch (status) {
      case 'confirmed':
        statusColor = AppColors.success;
        statusText = 'Confirmado';
        statusIcon = Icons.check_circle;
        break;
      case 'pending':
        statusColor = AppColors.warning;
        statusText = 'Pendente';
        statusIcon = Icons.schedule;
        break;
      case 'completed':
        statusColor = AppColors.primary;
        statusText = 'Concluído';
        statusIcon = Icons.check_circle_outline;
        break;
      case 'cancelled':
        statusColor = AppColors.error;
        statusText = 'Cancelado';
        statusIcon = Icons.cancel;
        break;
      default:
        statusColor = AppColors.textSecondary;
        statusText = 'Desconhecido';
        statusIcon = Icons.help_outline;
    }
    
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Builder(builder: (context) {
                      final photo = appointment?.petPhotoUrl;
                      return CircleAvatar(
                        radius: 20,
                        foregroundImage: (photo != null && photo.isNotEmpty)
                            ? NetworkImage(photo)
                            : null,
                        child: const Icon(Icons.pets, color: AppColors.textSecondary),
                      );
                    }),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 180,
                      child: Text(
                        service,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(statusIcon, size: 14, color: statusColor),
                      const SizedBox(width: 4),
                      Text(
                        statusText,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: statusColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: AppColors.primary),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    clinic,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 8),
            
            Row(
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 16, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            if (status == 'confirmed' || status == 'pending') ...[
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () async {
                      if (appointment == null) return;
                      await ref
                          .read(appointmentControllerProvider.notifier)
                          .updateStatus(
                            id: appointment.id,
                            status: AppointmentStatus.cancelled,
                          );
                      final user = ref.read(supabaseClientProvider).auth.currentUser;
                      if (user != null) {
                        ref.invalidate(ownerAppointmentsProvider(user.id));
                      }
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Agendamento cancelado')),
                      );
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: AppColors.error),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (appointment == null) return;
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: appointment.dateTime,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (pickedDate == null) return;
                      if (!mounted) return;
                      final pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(
                          hour: appointment.dateTime.hour,
                          minute: appointment.dateTime.minute,
                        ),
                      );
                      if (pickedTime == null) return;
                      final newDateTime = DateTime(
                        pickedDate.year,
                        pickedDate.month,
                        pickedDate.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                      await ref
                          .read(appointmentControllerProvider.notifier)
                          .reschedule(id: appointment.id, newDateTime: newDateTime);
                      final user = ref.read(supabaseClientProvider).auth.currentUser;
                      if (user != null) {
                        ref.invalidate(ownerAppointmentsProvider(user.id));
                      }
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Agendamento remarcado')),
                      );
                    },
                    child: const Text(
                      'Remarcar',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (appointment == null) return;
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (c) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 22,
                                      foregroundImage: (appointment.petPhotoUrl != null && appointment.petPhotoUrl!.isNotEmpty)
                                          ? NetworkImage(appointment.petPhotoUrl!)
                                          : null,
                                      child: const Icon(Icons.pets),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Pet: ${appointment.petName}', style: const TextStyle(fontWeight: FontWeight.w600)),
                                          if (appointment.petSpecies != null || appointment.petBreed != null)
                                            Text(
                                              [appointment.petSpecies, appointment.petBreed].where((e) => e != null && e.isNotEmpty).join(' • '),
                                              style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Detalhes do Agendamento',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      onPressed: () => Navigator.of(c).pop(),
                                      icon: const Icon(Icons.close),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text('Serviço: ${_formatType(appointment.type)}'),
                                Text('Veterinário: ${appointment.vetName ?? 'Veterinário'}'),
                                Text('Data: ${_formatDateOnly(appointment.dateTime)}'),
                                Text('Hora: ${_formatTime(appointment.dateTime)}'),
                                Text('Status: ${appointment.status.name}'),
                                if (appointment.notes != null && appointment.notes!.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text('Observações: ${appointment.notes!}'),
                                  ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Detalhes',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  if (status == 'confirmed')
                    TextButton(
                      onPressed: () async {
                        if (appointment == null) return;
                        final url = await ref
                            .read(callControllerProvider.notifier)
                            .startOrJoin(
                              appointmentId: appointment.id,
                              ownerId: appointment.ownerId,
                              vetId: appointment.vetId,
                            );
                        final uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri, mode: LaunchMode.externalApplication);
                        }
                      },
                      child: const Text(
                        'Teleconsulta',
                        style: TextStyle(color: AppColors.secondary),
                      ),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatType(AppointmentType type) {
    switch (type) {
      case AppointmentType.consultation:
        return 'Consulta';
      case AppointmentType.vaccine:
        return 'Vacina';
      case AppointmentType.exam:
        return 'Exame';
      case AppointmentType.surgery:
        return 'Cirurgia';
    }
  }

  String _formatDateOnly(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _formatTime(DateTime date) {
    final m = date.minute.toString().padLeft(2, '0');
    return '${date.hour}:$m';
  }
}
