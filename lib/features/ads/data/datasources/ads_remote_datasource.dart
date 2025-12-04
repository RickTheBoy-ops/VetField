import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/campaign_model.dart';

abstract class AdsRemoteDataSource {
  Future<List<CampaignModel>> getVetCampaigns(String vetId);
  Future<List<CampaignModel>> getActiveBanners({int limit = 5});
  Future<void> trackImpression(String campaignId);
  Future<void> trackClick(String campaignId);
}

class AdsRemoteDataSourceImpl implements AdsRemoteDataSource {
  final SupabaseClient supabaseClient;

  AdsRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<CampaignModel>> getVetCampaigns(String vetId) async {
    final response = await supabaseClient
        .from('campaigns')
        .select()
        .eq('vet_id', vetId)
        .order('created_at', ascending: false);

    return (response as List)
        .map((json) => CampaignModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<CampaignModel>> getActiveBanners({int limit = 5}) async {
    final response = await supabaseClient.rpc(
      'get_active_banners',
      params: {'limit_results': limit},
    );

    return (response as List)
        .map((json) => CampaignModel.fromJson(json))
        .toList();
  }

  @override
  Future<void> trackImpression(String campaignId) async {
    await supabaseClient.rpc(
      'increment_campaign_metric',
      params: {
        'campaign_id': campaignId,
        'metric_type': 'impression',
      },
    );
  }

  @override
  Future<void> trackClick(String campaignId) async {
    await supabaseClient.rpc(
      'increment_campaign_metric',
      params: {
        'campaign_id': campaignId,
        'metric_type': 'click',
      },
    );
  }
}
