import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/mock_data.dart';
import '../../features/owner/presentation/screens/vet_map_screen.dart';
import '../../widgets/section_header.dart';
import '../../widgets/vet_card.dart';
import '../../widgets/clinic_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _currentNavIndex == 1 ? const VetMapScreen() : _buildHomeContent(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHomeContent() {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: SafeArea(
        child: Column(
          children: [
            // Conteúdo Scrollável
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // HEADER
                    _buildHeader(),

                    // BARRA DE BUSCA
                    _buildSearchBar(),

                    const SizedBox(height: 24),

                    // CATEGORIAS
                    _buildCategories(),

                    const SizedBox(height: 24),

                    // PRÓXIMO AGENDAMENTO
                    _buildUpcomingAppointment(),

                    const SizedBox(height: 24),

                    // PERTO DE VOCÊ
                    _buildNearbyClinics(),

                    const SizedBox(height: 24),

                    // MELHORES VETERINÁRIOS
                    _buildTopVets(),

                    const SizedBox(height: 100), // Espaço para Bottom Nav
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ========================
  // HEADER
  // ========================
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Saudação
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Olá, Ana 👋',
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 4),
              Text(
                'Bem-vinda ao\nVetField',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  height: 1.2,
                ),
              ),
            ],
          ),

          // Notificação
          Container(
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(99),
              border: Border.all(color: AppColors.border, width: 1),
            ),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    // TODO: Navegar para notificações
                  },
                  icon: const Icon(LucideIcons.bell, size: 24),
                  color: AppColors.textPrimary,
                ),

                // Badge de notificação
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.error,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: AppColors.cardBackground,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ========================
  // BARRA DE BUSCA
  // ========================
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Buscar veterinários...',
            hintStyle: TextStyle(fontSize: 16, color: AppColors.textSecondary),
            prefixIcon: const Icon(
              LucideIcons.search,
              size: 20,
              color: AppColors.textSecondary,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ),
    );
  }

  // ========================
  // CATEGORIAS
  // ========================
  Widget _buildCategories() {
    final iconMap = {
      'scissors': LucideIcons.scissors,
      'home': Icons.home, // Fallback to Material Icons
      'stethoscope': Icons.medical_services, // Fallback to Material Icons
      'more-horizontal': Icons.more_horiz, // Fallback to Material Icons
    };

    return Column(
      children: [
        const SectionHeader(title: 'Categorias'),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: MockData.categories.map((category) {
              final iconName = category['icon'] as String;
              final icon = iconMap[iconName] ?? Icons.circle_outlined;

              return GestureDetector(
                onTap: () {
                  // TODO: Navegar para categoria
                },
                child: Column(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: Icon(icon, size: 24, color: AppColors.primary),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 80,
                      child: Text(
                        category['name'] as String,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // ========================
  // PRÓXIMO AGENDAMENTO
  // ========================
  Widget _buildUpcomingAppointment() {
    final appointment = MockData.upcomingAppointment;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Próximo Agendamento',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),

          Container(
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppColors.secondary.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Cabeçalho do Card
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: appointment['image'] as String,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.white.withValues(alpha: 0.2),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: Colors.white.withValues(alpha: 0.2),
                            child: const Icon(Icons.pets, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              appointment['type'] as String,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  LucideIcons.clock,
                                  size: 12,
                                  color: Colors.white70,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  appointment['time'] as String,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Footer do Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              LucideIcons.calendar,
                              size: 16,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              appointment['date'] as String,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),

                        GestureDetector(
                          onTap: () {
                            // TODO: Ver detalhes
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Ver Detalhes',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ========================
  // PERTO DE VOCÊ
  // ========================
  Widget _buildNearbyClinics() {
    return Column(
      children: [
        const SectionHeader(title: 'Perto de Você'),
        const SizedBox(height: 8),
        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: MockData.nearbyClinics.length,
            itemBuilder: (context, index) {
              final clinic = MockData.nearbyClinics[index];
              return Padding(
                padding: EdgeInsets.only(
                  right: index < MockData.nearbyClinics.length - 1 ? 16 : 0,
                ),
                child: ClinicCard(
                  id: clinic['id'] as int,
                  name: clinic['name'] as String,
                  location: clinic['location'] as String,
                  rating: (clinic['rating'] as num).toDouble(),
                  reviews: clinic['reviews'] as int,
                  image: clinic['image'] as String,
                  onTap: () {
                    // TODO: Navegar para detalhes da clínica
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ========================
  // MELHORES VETERINÁRIOS
  // ========================
  Widget _buildTopVets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SectionHeader(title: 'Melhores Veterinários'),
          const SizedBox(height: 8),
          ...MockData.topVets.map((vet) {
            final index = MockData.topVets.indexOf(vet);
            return Padding(
              padding: EdgeInsets.only(
                bottom: index < MockData.topVets.length - 1 ? 16 : 0,
              ),
              child: VetCard(
                id: vet['id'] as int,
                name: vet['name'] as String,
                specialty: vet['specialty'] as String,
                rating: (vet['rating'] as num).toDouble(),
                image: vet['image'] as String,
                available: vet['available'] as String,
                onTap: () {
                  // TODO: Navegar para detalhes do veterinário
                },
              ),
            );
          }),
        ],
      ),
    );
  }

  // ========================
  // BOTTOM NAVIGATION BAR
  // ========================
  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        border: Border(top: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(0, Icons.home, 'Home'),
              _buildNavItem(1, Icons.explore, 'Explorar'),

              // Botão Central Elevado
              Transform.translate(
                offset: const Offset(0, -16),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(99),
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {
                      // TODO: Ação central (nova consulta)
                    },
                    icon: const Icon(
                      Icons.medical_services,
                      size: 28,
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(16),
                  ),
                ),
              ),

              _buildNavItem(2, Icons.favorite, 'Favoritos'),
              _buildNavItem(3, Icons.person, 'Perfil'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isActive = _currentNavIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentNavIndex = index;
        });
        // TODO: Navegar para tela correspondente
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: isActive ? AppColors.primary : const Color(0xFF9CA3AF),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: isActive ? AppColors.primary : const Color(0xFF9CA3AF),
            ),
          ),
        ],
      ),
    );
  }
}
