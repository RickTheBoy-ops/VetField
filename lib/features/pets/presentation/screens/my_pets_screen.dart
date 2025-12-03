import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/pet_entity.dart';
import '../providers/pets_provider.dart';
import 'add_edit_pet_screen.dart';

class MyPetsScreen extends ConsumerWidget {
  const MyPetsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myPetsControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pets'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddEditPetScreen(),
            ),
          );
          ref.invalidate(myPetsControllerProvider);
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (pets) {
          if (pets.isEmpty) {
            return const Center(child: Text('Você ainda não cadastrou pets'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(24),
            itemCount: pets.length,
            itemBuilder: (context, index) {
              final pet = pets[index];
              return _PetCard(
                pet: pet,
                onEdit: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AddEditPetScreen(pet: pet),
                    ),
                  );
                  ref.invalidate(myPetsControllerProvider);
                },
                onDelete: () async {
                  await ref.read(myPetsControllerProvider.notifier).remove(pet.id);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _PetCard extends StatelessWidget {
  final PetEntity pet;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _PetCard({
    required this.pet,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shadowColor: AppColors.cardShadow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 72,
                height: 72,
                child: pet.photoUrl != null && pet.photoUrl!.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: pet.photoUrl!,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: AppColors.background,
                        child: const Icon(Icons.pets, size: 32, color: AppColors.textSecondary),
                      ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pet.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _subtitle(pet),
                    style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: onEdit, icon: const Icon(Icons.edit, color: AppColors.textSecondary)),
            IconButton(onPressed: onDelete, icon: const Icon(Icons.delete_outline, color: AppColors.error)),
          ],
        ),
      ),
    );
  }

  String _subtitle(PetEntity p) {
    final species = p.species == PetSpecies.dog ? 'Cachorro' : 'Gato';
    final gender = p.gender == PetGender.male
        ? 'Macho'
        : p.gender == PetGender.female
            ? 'Fêmea'
            : '';
    final breed = p.breed ?? '';
    final parts = [species, gender, breed];
    return parts.where((e) => e.isNotEmpty).join(' • ');
  }
}

