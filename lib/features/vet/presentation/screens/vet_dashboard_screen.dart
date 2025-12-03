import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/providers/supabase_provider.dart'; // Para pegar ID
import '../../../appointment/presentation/providers/appointment_provider.dart';
import '../../../appointment/domain/entities/appointment_entity.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../call/presentation/providers/call_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class VetDashboardScreen extends ConsumerStatefulWidget {
  const VetDashboardScreen({super.key});

  @override
  ConsumerState<VetDashboardScreen> createState() => _VetDashboardScreenState();
}

class _VetDashboardScreenState extends ConsumerState<VetDashboardScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = ref.read(supabaseClientProvider).auth.currentUser;
      if (user != null) {
        ref.read(vetAppointmentsRealtimeProvider.notifier).subscribe(user.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Painel do Veterinário'),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: AppColors.textPrimary,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.settings_outlined,
              color: AppColors.textPrimary,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildDashboardTab(),
          _buildScheduleTab(),
          _buildPatientsTab(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Painel',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            selectedIcon: Icon(Icons.calendar_today),
            label: 'Agenda',
          ),
          NavigationDestination(
            icon: Icon(Icons.pets_outlined),
            selectedIcon: Icon(Icons.pets),
            label: 'Pacientes',
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildKPICards(),
          const SizedBox(height: 24),
          _buildRevenueCharts(),
          const SizedBox(height: 24),
          const Text(
            'Próximas Consultas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildUpcomingAppointmentsList(),
        ],
      ),
    );
  }

  Widget _buildScheduleTab() {
    return const Center(child: Text('Agenda (Em construção)'));
  }

  Widget _buildPatientsTab() {
    return const Center(child: Text('Pacientes (Em construção)'));
  }

  Widget _buildKPICards() {
    return Row(
      children: [
        Expanded(
          child: _KPICard(
            title: 'Hoje',
            value: '8',
            subtitle: 'Consultas',
            icon: Icons.calendar_today,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _KPICard(
            title: 'Faturamento',
            value: 'R\$ 1.2k',
            subtitle: 'Nesta semana',
            icon: Icons.attach_money,
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  Widget _buildRevenueCharts() {
    final user = ref.watch(supabaseClientProvider).auth.currentUser;
    if (user == null) return const SizedBox.shrink();
    final appointmentsAsync = ref.watch(vetAppointmentsProvider(user.id));
    return appointmentsAsync.when(
      data: (appointments) {
        final weeklyData = _computeDailyRevenue(appointments, days: 7);
        final monthlyByMonth = _computeMonthlyRevenue(appointments, months: 6);
        final byType = _computeRevenueByType(appointments);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Faturamento diário (7 dias)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true, drawVerticalLine: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final idx = value.toInt();
                          final label = _weekdayLabel(idx, days: 7);
                          return Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              label,
                              style: const TextStyle(fontSize: 10),
                            ),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: weeklyData,
                      isCurved: true,
                      color: AppColors.primary,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.primary.withValues(alpha: 0.1),
                      ),
                    ),
                  ],
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Faturamento mensal (6 meses)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final idx = value.toInt();
                          final label = _monthLabel(idx, months: 6);
                          return Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              label,
                              style: const TextStyle(fontSize: 10),
                            ),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    for (int i = 0; i < monthlyByMonth.length; i++)
                      BarChartGroupData(
                        x: i,
                        barRods: [
                          BarChartRodData(
                            toY: monthlyByMonth[i],
                            color: Colors.green,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Receita por tipo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 30,
                  sections: [
                    for (final entry in byType.entries)
                      PieChartSectionData(
                        value: entry.value,
                        title: _formatType(entry.key),
                        color: _typeColor(entry.key),
                        titleStyle: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Erro ao carregar faturamento: $e')),
    );
  }

  List<FlSpot> _computeDailyRevenue(
    List<AppointmentEntity> appointments, {
    int days = 7,
  }) {
    final now = DateTime.now();
    final start = DateTime(
      now.year,
      now.month,
      now.day,
    ).subtract(Duration(days: days - 1));
    final buckets = List<double>.filled(days, 0);
    for (final a in appointments) {
      if (a.status == AppointmentStatus.cancelled) continue;
      final dayDate = DateTime(
        a.dateTime.year,
        a.dateTime.month,
        a.dateTime.day,
      );
      if (dayDate.isBefore(start)) continue;
      final index = dayDate.difference(start).inDays;
      if (index >= 0 && index < days) {
        buckets[index] += a.price;
      }
    }
    return [for (int i = 0; i < days; i++) FlSpot(i.toDouble(), buckets[i])];
  }

  List<double> _computeMonthlyRevenue(
    List<AppointmentEntity> appointments, {
    int months = 6,
  }) {
    final now = DateTime.now();
    final buckets = List<double>.filled(months, 0);
    for (final a in appointments) {
      if (a.status == AppointmentStatus.cancelled) continue;
      final monthsDiff =
          (now.year - a.dateTime.year) * 12 + (now.month - a.dateTime.month);
      if (monthsDiff >= 0 && monthsDiff < months) {
        final index = months - 1 - monthsDiff;
        buckets[index] += a.price;
      }
    }
    return buckets;
  }

  Map<AppointmentType, double> _computeRevenueByType(
    List<AppointmentEntity> appointments,
  ) {
    final Map<AppointmentType, double> map = {
      AppointmentType.consultation: 0,
      AppointmentType.vaccine: 0,
      AppointmentType.exam: 0,
      AppointmentType.surgery: 0,
    };
    for (final a in appointments) {
      if (a.status == AppointmentStatus.cancelled) continue;
      map[a.type] = (map[a.type] ?? 0) + a.price;
    }
    return map;
  }

  String _weekdayLabel(int index, {int days = 7}) {
    final now = DateTime.now();
    final date = DateTime(
      now.year,
      now.month,
      now.day,
    ).subtract(Duration(days: days - 1 - index));
    const names = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'];
    return names[date.weekday - 1];
  }

  String _monthLabel(int index, {int months = 6}) {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month - (months - 1 - index));
    const names = [
      'Jan',
      'Fev',
      'Mar',
      'Abr',
      'Mai',
      'Jun',
      'Jul',
      'Ago',
      'Set',
      'Out',
      'Nov',
      'Dez',
    ];
    return names[(date.month - 1) % 12];
  }

  Color _typeColor(AppointmentType type) {
    switch (type) {
      case AppointmentType.consultation:
        return Colors.blue;
      case AppointmentType.vaccine:
        return Colors.orange;
      case AppointmentType.exam:
        return Colors.purple;
      case AppointmentType.surgery:
        return Colors.red;
    }
  }

  Widget _buildUpcomingAppointmentsList() {
    final user = ref.watch(supabaseClientProvider).auth.currentUser;
    if (user == null) {
      return const Center(child: Text('Erro: Usuário não logado'));
    }

    final appointmentsAsync = ref.watch(vetAppointmentsProvider(user.id));

    return appointmentsAsync.when(
      data: (appointments) {
        if (appointments.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Nenhum agendamento encontrado.'),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            final apt = appointments[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: _getStatusColor(
                            apt.status,
                          ).withValues(alpha: 0.1),
                          child: Icon(
                            Icons.pets,
                            color: _getStatusColor(apt.status),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${apt.petName} - ${_formatType(apt.type)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '${_formatDate(apt.dateTime)} - Tutor: ${apt.ownerName ?? "N/A"}',
                                style: const TextStyle(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Chip(
                          label: Text(_formatStatus(apt.status)),
                          backgroundColor: _getStatusColor(
                            apt.status,
                          ).withValues(alpha: 0.2),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (apt.status == AppointmentStatus.pending)
                      Row(
                        children: [
                          TextButton(
                            onPressed: () async {
                              await ref
                                  .read(appointmentControllerProvider.notifier)
                                  .updateStatus(
                                    id: apt.id,
                                    status: AppointmentStatus.confirmed,
                                  );
                              ref.invalidate(vetAppointmentsProvider);
                            },
                            child: const Text('Aceitar'),
                          ),
                          const SizedBox(width: 12),
                          TextButton(
                            onPressed: () async {
                              final confirmed = await showDialog<bool>(
                                context: context,
                                builder: (c) => AlertDialog(
                                  title: const Text('Recusar agendamento?'),
                                  content: const Text(
                                    'Esta ação não pode ser desfeita.',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(c).pop(false),
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(c).pop(true),
                                      child: const Text('Confirmar'),
                                    ),
                                  ],
                                ),
                              );
                              if (confirmed != true) return;
                              await ref
                                  .read(appointmentControllerProvider.notifier)
                                  .updateStatus(
                                    id: apt.id,
                                    status: AppointmentStatus.cancelled,
                                  );
                              if (!context.mounted) return;
                              ref.invalidate(vetAppointmentsProvider);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Agendamento recusado'),
                                ),
                              );
                            },
                            child: const Text('Recusar'),
                          ),
                        ],
                      ),
                    if (apt.status == AppointmentStatus.confirmed)
                      Row(
                        children: [
                          TextButton(
                            onPressed: () async {
                              final ok = await showDialog<bool>(
                                context: context,
                                builder: (c) => AlertDialog(
                                  title: const Text('Concluir atendimento?'),
                                  content: const Text(
                                    'Isso marcará o agendamento como concluído.',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(c).pop(false),
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(c).pop(true),
                                      child: const Text('Concluir'),
                                    ),
                                  ],
                                ),
                              );
                              if (ok != true) return;
                              await ref
                                  .read(appointmentControllerProvider.notifier)
                                  .updateStatus(
                                    id: apt.id,
                                    status: AppointmentStatus.completed,
                                  );
                              await ref
                                  .read(callControllerProvider.notifier)
                                  .complete(appointmentId: apt.id);
                              if (!context.mounted) return;
                              ref.invalidate(vetAppointmentsProvider);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Atendimento concluído'),
                                ),
                              );
                            },
                            child: const Text('Concluir'),
                          ),
                          const SizedBox(width: 12),
                          TextButton(
                            onPressed: () async {
                              final url = await ref
                                  .read(callControllerProvider.notifier)
                                  .startOrJoin(
                                    appointmentId: apt.id,
                                    ownerId: apt.ownerId,
                                    vetId: apt.vetId,
                                  );
                              final uri = Uri.parse(url);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(
                                  uri,
                                  mode: LaunchMode.externalApplication,
                                );
                              }
                            },
                            child: const Text('Teleconsulta'),
                          ),
                          const SizedBox(width: 12),
                          TextButton(
                            onPressed: () async {
                              final pickedDate = await showDatePicker(
                                context: context,
                                initialDate: apt.dateTime,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(
                                  const Duration(days: 365),
                                ),
                              );
                              if (pickedDate == null) return;
                              if (!context.mounted) return;
                              final pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay(
                                  hour: apt.dateTime.hour,
                                  minute: apt.dateTime.minute,
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
                                  .reschedule(
                                    id: apt.id,
                                    newDateTime: newDateTime,
                                  );
                              if (!context.mounted) return;
                              ref.invalidate(vetAppointmentsProvider);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Agendamento remarcado'),
                                ),
                              );
                            },
                            child: const Text('Remarcar'),
                          ),
                          const SizedBox(width: 12),
                          TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                ),
                                builder: (c) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      16,
                                      16,
                                      16,
                                      24,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Detalhes do Agendamento',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () =>
                                                  Navigator.of(c).pop(),
                                              icon: const Icon(Icons.close),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text('Paciente: ${apt.petName}'),
                                        Text('Tipo: ${_formatType(apt.type)}'),
                                        Text(
                                          'Tutor: ${apt.ownerName ?? 'N/A'}',
                                        ),
                                        Text(
                                          'Data: ${_formatDate(apt.dateTime)}',
                                        ),
                                        Text(
                                          'Status: ${_formatStatus(apt.status)}',
                                        ),
                                        if (apt.notes != null &&
                                            apt.notes!.isNotEmpty)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 8.0,
                                            ),
                                            child: Text(
                                              'Observações: ${apt.notes!}',
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Text('Detalhes'),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Erro: $err')),
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

  String _formatStatus(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.pending:
        return 'Pendente';
      case AppointmentStatus.confirmed:
        return 'Confirmado';
      case AppointmentStatus.completed:
        return 'Concluído';
      case AppointmentStatus.cancelled:
        return 'Cancelado';
    }
  }

  Color _getStatusColor(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.pending:
        return Colors.orange;
      case AppointmentStatus.confirmed:
        return Colors.blue;
      case AppointmentStatus.completed:
        return Colors.green;
      case AppointmentStatus.cancelled:
        return Colors.red;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month} às ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}

class _KPICard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _KPICard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color),
              Text(
                title,
                style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
