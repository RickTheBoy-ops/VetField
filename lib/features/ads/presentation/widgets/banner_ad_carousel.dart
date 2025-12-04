import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/entities/campaign_entity.dart';
import '../providers/ads_provider.dart';

class BannerAdCarousel extends ConsumerStatefulWidget {
  const BannerAdCarousel({super.key});

  @override
  ConsumerState<BannerAdCarousel> createState() => _BannerAdCarouselState();
}

class _BannerAdCarouselState extends ConsumerState<BannerAdCarousel> {
  int _currentIndex = 0;
  final Set<String> _trackedImpressions = {};

  void _trackImpression(String campaignId) {
    if (!_trackedImpressions.contains(campaignId)) {
      _trackedImpressions.add(campaignId);
      ref.read(adTrackingControllerProvider.notifier).trackImpression(campaignId);
    }
  }

  void _onBannerTap(CampaignEntity campaign) {
    ref.read(adTrackingControllerProvider.notifier).trackClick(campaign.id);
    // TODO: Navigate to vet profile
    // context.push('/vet-details/${campaign.vetId}');
  }

  @override
  Widget build(BuildContext context) {
    final bannersAsync = ref.watch(activeBannersProviderProvider);

    return bannersAsync.when(
      loading: () => const SizedBox(
        height: 180,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const SizedBox.shrink(),
      data: (banners) {
        if (banners.isEmpty) return const SizedBox.shrink();

        // Track impression for current banner
        if (_currentIndex < banners.length) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _trackImpression(banners[_currentIndex].id);
          });
        }

        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 180,
                viewportFraction: 0.92,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                onPageChanged: (index, reason) {
                  setState(() => _currentIndex = index);
                  _trackImpression(banners[index].id);
                },
              ),
              items: banners.map((banner) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () => _onBannerTap(banner),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: banner.imageUrl != null
                              ? CachedNetworkImage(
                                  imageUrl: banner.imageUrl!,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: Colors.grey[200],
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    color: Colors.grey[300],
                                    child: const Icon(Icons.image, size: 48),
                                  ),
                                )
                              : Container(
                                  color: Colors.grey[300],
                                  child: const Center(
                                    child: Icon(Icons.ad_units, size: 48),
                                  ),
                                ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            // Dots indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: banners.asMap().entries.map((entry) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key
                        ? Theme.of(context).primaryColor
                        : Colors.grey[300],
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
