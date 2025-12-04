import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/supabase_provider.dart';
import '../../data/datasources/ads_remote_datasource.dart';
import '../../data/repositories/ads_repository_impl.dart';
import '../../domain/repositories/ads_repository.dart';
import '../../domain/usecases/get_active_campaigns_usecase.dart';
import '../../domain/usecases/track_impression_usecase.dart';
import '../../domain/usecases/track_click_usecase.dart';
import '../../domain/entities/campaign_entity.dart';

part 'ads_provider.g.dart';

// Data Sources
@riverpod
AdsRemoteDataSource adsRemoteDataSource(Ref ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return AdsRemoteDataSourceImpl(supabaseClient);
}

// Repositories
@riverpod
AdsRepository adsRepository(Ref ref) {
  final remoteDataSource = ref.watch(adsRemoteDataSourceProvider);
  return AdsRepositoryImpl(remoteDataSource: remoteDataSource);
}

// Use Cases
@riverpod
GetActiveCampaignsUseCase getActiveCampaignsUseCase(Ref ref) {
  final repository = ref.watch(adsRepositoryProvider);
  return GetActiveCampaignsUseCase(repository);
}

@riverpod
TrackImpressionUseCase trackImpressionUseCase(Ref ref) {
  final repository = ref.watch(adsRepositoryProvider);
  return TrackImpressionUseCase(repository);
}

@riverpod
TrackClickUseCase trackClickUseCase(Ref ref) {
  final repository = ref.watch(adsRepositoryProvider);
  return TrackClickUseCase(repository);
}

// Active Banners Provider (Home Screen)
@riverpod
Future<List<CampaignEntity>> activeBannersProvider(Ref ref) async {
  final useCase = ref.watch(getActiveCampaignsUseCaseProvider);
  final result = await useCase(GetActiveCampaignsParams(limit: 5));
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (campaigns) => campaigns,
  );
}

// Vet Campaigns Provider (Ads Manager Screen)
@riverpod
Future<List<CampaignEntity>> vetCampaignsProvider(Ref ref, String vetId) async {
  final useCase = ref.watch(getActiveCampaignsUseCaseProvider);
  final result = await useCase(GetActiveCampaignsParams(vetId: vetId));
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (campaigns) => campaigns,
  );
}

// Ad Tracking Controller
@riverpod
class AdTrackingController extends _$AdTrackingController {
  @override
  FutureOr<void> build() => null;

  Future<void> trackImpression(String campaignId) async {
    final useCase = ref.read(trackImpressionUseCaseProvider);
    await useCase(campaignId);
  }

  Future<void> trackClick(String campaignId) async {
    final useCase = ref.read(trackClickUseCaseProvider);
    await useCase(campaignId);
  }
}
