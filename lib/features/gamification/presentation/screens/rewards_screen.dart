import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/gamification_entities.dart';
import '../providers/gamification_provider.dart';

class RewardsScreen extends ConsumerWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(userGamificationProfileProvider);
    final transactionsAsync = ref.watch(userTransactionHistoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('PetPoints'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            profileAsync.when(
              loading: () => const SizedBox(height: 150),
              error: (_, __) => const SizedBox.shrink(),
              data: (profile) => _buildHeaderCard(profile),
            ),
            const SizedBox(height: 24),
            // How to Earn Points
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Como Ganhar Pontos',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildMissionCard(
                    'Login Diário',
                    '10 pts',
                    Icons.login,
                    'Entre no app todos os dias',
                  ),
                  _buildMissionCard(
                    'Vacina Registrada',
                    '50 pts',
                    Icons.vaccines,
                    'Mantenha as vacinas em dia',
                  ),
                  _buildMissionCard(
                    'Consulta Concluída',
                    '30 pts',
                    Icons.medical_services,
                    'Complete uma consulta',
                  ),
                  _buildMissionCard(
                    'Indique um Amigo',
                    '100 pts',
                    Icons.people,
                    'Convide amigos para o VetField',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Rewards Store (Placeholder)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Loja de Recompensas',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Em breve você poderá trocar seus pontos por descontos!',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildRewardCard(
                    '10% OFF',
                    '500 pts',
                    'Desconto em qualquer consulta',
                    Colors.blue,
                  ),
                  _buildRewardCard(
                    '20% OFF',
                    '1000 pts',
                    'Desconto em vacinas',
                    Colors.orange,
                  ),
                  _buildRewardCard(
                    'Consulta Grátis',
                    '2000 pts',
                    'Uma consulta completa gratuita',
                    Colors.green,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Transaction History
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Histórico',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  transactionsAsync.when(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (_, __) => const Text('Erro ao carregar histórico'),
                    data: (transactions) {
                      if (transactions.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Text(
                              'Nenhuma transação ainda',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        );
                      }
                      return Column(
                        children: transactions.map((transaction) {
                          return _buildTransactionTile(transaction);
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard(GamificationProfile profile) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Icon(Icons.emoji_events, color: Colors.white, size: 48),
          const SizedBox(height: 16),
          Text(
            profile.levelTitle,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${profile.currentPoints} Pontos',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('Nível', '${profile.level}'),
              _buildStatItem('Total', '${profile.lifetimePoints}'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildMissionCard(
    String title,
    String points,
    IconData icon,
    String description,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            points,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardCard(
    String title,
    String cost,
    String description,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.card_giftcard, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                cost,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Em breve',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionTile(PointTransaction transaction) {
    return ListTile(
      leading: Icon(
        transaction.isPositive ? Icons.add_circle : Icons.remove_circle,
        color: transaction.isPositive ? Colors.green : Colors.red,
      ),
      title: Text(transaction.description ?? _getActionName(transaction.actionType)),
      subtitle: Text(
        _formatDate(transaction.createdAt),
        style: const TextStyle(fontSize: 12),
      ),
      trailing: Text(
        '${transaction.isPositive ? '+' : ''}${transaction.amount}',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: transaction.isPositive ? Colors.green : Colors.red,
        ),
      ),
    );
  }

  String _getActionName(PointActionType type) {
    switch (type) {
      case PointActionType.dailyLogin:
        return 'Login Diário';
      case PointActionType.vaccineRegistered:
        return 'Vacina Registrada';
      case PointActionType.appointmentCompleted:
        return 'Consulta Concluída';
      case PointActionType.referral:
        return 'Indicação';
      case PointActionType.profileCompleted:
        return 'Perfil Completo';
      case PointActionType.firstPetRegistered:
        return 'Primeiro Pet';
      case PointActionType.healthRecordUpdated:
        return 'Registro de Saúde';
      case PointActionType.reviewSubmitted:
        return 'Avaliação Enviada';
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    
    if (diff.inDays == 0) {
      return 'Hoje';
    } else if (diff.inDays == 1) {
      return 'Ontem';
    } else if (diff.inDays < 7) {
      return '${diff.inDays} dias atrás';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
