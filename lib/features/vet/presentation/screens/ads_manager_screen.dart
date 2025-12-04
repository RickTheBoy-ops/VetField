import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/error_boundary.dart';
import '../../../ads/presentation/providers/ads_provider.dart';
import '../../../ads/domain/entities/campaign_entity.dart';
import '../../../../core/providers/supabase_provider.dart';

class AdsManagerScreen extends ConsumerWidget {
  const AdsManagerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(supabaseClientProvider).auth.currentUser;
    
    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('Usuário não autenticado')),
      );
    }

    final campaignsAsync = ref.watch(vetCampaignsProviderProvider(user.id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Campanhas'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: campaignsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => ErrorBoundary(
          error: error,
          onRetry: () => ref.refresh(vetCampaignsProviderProvider(user.id)),
        ),
        data: (campaigns) {
          if (campaigns.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.campaign, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'Nenhuma campanha ativa',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Navigate to create campaign screen
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Funcionalidade em desenvolvimento'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Criar Nova Campanha'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Summary Card
                _buildSummaryCard(campaigns),
                const SizedBox(height: 24),
                // Campaign List
                const Text(
                  'Campanhas Ativas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ...campaigns.map((campaign) => _buildCampaignCard(campaign)),
                const SizedBox(height: 16),
                // Create New Campaign Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Funcionalidade em desenvolvimento'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Criar Nova Campanha'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSummaryCard(List<CampaignEntity> campaigns) {
    final totalImpressions = campaigns.fold(
      0,
      (sum, campaign) => sum + campaign.impressionsCount,
    );
    final totalClicks = campaigns.fold(
      0,
      (sum, campaign) => sum + campaign.clicksCount,
    );
    final totalSpend = campaigns.fold(
      0.0,
      (sum, campaign) => sum + campaign.currentSpend,
    );
    final avgCtr = totalImpressions > 0
        ? (totalClicks / totalImpressions) * 100
        : 0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildSummaryItem(
                  'Visualizações',
                  '$totalImpressions',
                  Icons.visibility,
                ),
              ),
              Container(
                width: 1,
                height: 40,
                color: Colors.white.withValues(alpha: 0.3),
              ),
              Expanded(
                child: _buildSummaryItem(
                  'Cliques',
                  '$totalClicks',
                  Icons.touch_app,
                ),
              ),
            ],
          ),
         const Divider(color: Colors.white24, height: 32),
          Row(
            children: [
              Expanded(
                child: _buildSummaryItem(
                  'CTR',
                  '${avgCtr.toStringAsFixed(1)}%',
                  Icons.insights,
                ),
              ),
              Container(
                width: 1,
                height: 40,
                color: Colors.white.withValues(alpha: 0.3),
              ),
              Expanded(
                child: _buildSummaryItem(
                  'Investido',
                  'R\$ ${totalSpend.toStringAsFixed(2)}',
                  Icons.attach_money,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
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

  Widget _buildCampaignCard(CampaignEntity campaign) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                campaign.type == CampaignType.bannerHome
                    ? Icons.image
                    : Icons.search,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  campaign.type == CampaignType.bannerHome
                      ? 'Banner Home'
                      : 'Destaque na Busca',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildStatusChip(campaign.status),
            ],
          ),
          const SizedBox(height: 16),
          // Metrics
          Row(
            children: [
              Expanded(
                child: _buildMetricItem(
                  'Visualizações',
                  '${campaign.impressionsCount}',
                ),
              ),
              Expanded(
                child: _buildMetricItem(
                  'Cliques',
                  '${campaign.clicksCount}',
                ),
              ),
              Expanded(
                child: _buildMetricItem(
                  'CTR',
                  '${campaign.ctr.toStringAsFixed(1)}%',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Budget Progress
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Orçamento',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    'R\$ ${campaign.currentSpend.toStringAsFixed(2)} / R\$ ${campaign.budget.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: campaign.budgetUsagePercentage / 100,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(
                  campaign.budgetUsagePercentage > 80
                      ? Colors.red
                      : AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(CampaignStatus status) {
    Color color;
    String label;
    
    switch (status) {
      case CampaignStatus.active:
        color = Colors.green;
        label = 'Ativa';
        break;
      case CampaignStatus.paused:
        color = Colors.orange;
        label = 'Pausada';
        break;
      case CampaignStatus.finished:
        color = Colors.grey;
        label = 'Finalizada';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildMetricItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
