import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/vet_card.dart';
import 'filter_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/owner/presentation/providers/vet_provider.dart';
import 'package:geolocator/geolocator.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});
  
  @override
 ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _recentSearches = ['Dermatologista', 'Banho e Tosa', 'Vacina'];
  bool _showResults = false;
  double? _maxPrice;
  String? _specialty;
  double? _minRating;
  double? _radiusKm;
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  
  void _showFilters() async {
    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FilterBottomSheet(),
    );
    if (!mounted) return;
    if (result != null) {
      _maxPrice = (result['maxPrice'] as double?)?.toDouble();
      _specialty = result['specialty'] as String?;
      _minRating = (result['minRating'] as double?)?.toDouble();
      _radiusKm = (result['radiusKm'] as double?)?.toDouble();
      _triggerSearch();
    }
  }

  Future<void> _triggerSearch() async {
    setState(() {
      _showResults = true;
    });
    if (_radiusKm != null) {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return;
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return;
      }
      if (permission == LocationPermission.deniedForever) return;
      final pos = await Geolocator.getCurrentPosition();
      if (!mounted) return;
      final notifier = ref.read(searchVetsControllerProvider.notifier);
      await notifier.search(
        query: _searchController.text.trim(),
        specialty: _specialty,
        maxPrice: _maxPrice,
        minRating: _minRating,
        lat: pos.latitude,
        lng: pos.longitude,
        radiusKm: _radiusKm,
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Container(
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: _searchController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Buscar veterinários, serviços...',
              hintStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
              prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary, size: 20),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      onPressed: () {
                        setState(() {
                          _searchController.clear();
                          _showResults = false;
                        });
                      },
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            onChanged: (value) {
              setState(() {
                _showResults = value.isNotEmpty;
              });
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: AppColors.textPrimary),
            onPressed: _showFilters,
          ),
        ],
      ),
      body: _showResults ? _buildResults() : _buildRecentSearches(),
    );
  }
  
  Widget _buildRecentSearches() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Buscas Recentes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _recentSearches.clear();
                  });
                },
                child: const Text(
                  'Limpar',
                  style: TextStyle(color: AppColors.primary, fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...(_recentSearches.map((search) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.history, color: AppColors.textSecondary),
                title: Text(search),
                trailing: IconButton(
                  icon: const Icon(Icons.close, size: 20, color: AppColors.textSecondary),
                  onPressed: () {
                    setState(() {
                      _recentSearches.remove(search);
                    });
                  },
                ),
                onTap: () {
                  _searchController.text = search;
                  setState(() {
                    _showResults = true;
                  });
                },
              ))),
        ],
      ),
    );
  }
  
  Widget _buildResults() {
    return Consumer(builder: (context, ref, _) {
      final controller = ref.watch(searchVetsControllerProvider);
      final vets = controller.value ?? [];
      if (controller.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: vets.length,
        itemBuilder: (context, index) {
          final vet = vets[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: VetCard(
              id: int.tryParse(vet.id) ?? index,
              name: vet.name,
              specialty: vet.specialty,
              rating: vet.rating,
              image: vet.avatarUrl,
              available: vet.isAvailable ? 'Disponível' : 'Indisponível',
              onTap: () {},
            ),
          );
        },
      );
    });
  }
}
