import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/providers/supabase_provider.dart';
import '../../domain/entities/pet_entity.dart';
import '../../domain/usecases/add_pet_usecase.dart';
import '../../domain/usecases/update_pet_usecase.dart';
import '../providers/pets_provider.dart';

class AddEditPetScreen extends ConsumerStatefulWidget {
  final PetEntity? pet;
  const AddEditPetScreen({super.key, this.pet});

  @override
  ConsumerState<AddEditPetScreen> createState() => _AddEditPetScreenState();
}

class _AddEditPetScreenState extends ConsumerState<AddEditPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _weightController = TextEditingController();
  PetSpecies _species = PetSpecies.dog;
  PetGender? _gender;
  DateTime? _birthDate;
  String? _photoUrl;
  bool _uploading = false;

  @override
  void initState() {
    super.initState();
    final p = widget.pet;
    if (p != null) {
      _nameController.text = p.name;
      _breedController.text = p.breed ?? '';
      _weightController.text = p.weight?.toString() ?? '';
      _species = p.species;
      _gender = p.gender;
      _birthDate = p.birthDate;
      _photoUrl = p.photoUrl;
    }
  }

  Future<void> _pickPhoto() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery, maxWidth: 1600);
    if (image == null) return;
    setState(() => _uploading = true);
    final client = ref.read(supabaseClientProvider);
    final user = client.auth.currentUser;
    if (user == null) {
      setState(() => _uploading = false);
      return;
    }
    final path = 'pets/${user.id}_${DateTime.now().millisecondsSinceEpoch}.jpg';
    await client.storage.from('pet-photos').upload(path, File(image.path));
    final publicUrl = client.storage.from('pet-photos').getPublicUrl(path);
    setState(() {
      _photoUrl = publicUrl;
      _uploading = false;
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final client = ref.read(supabaseClientProvider);
    final user = client.auth.currentUser;
    if (user == null) return;

    if (widget.pet == null) {
      await ref.read(myPetsControllerProvider.notifier).add(
            AddPetParams(
              ownerId: user.id,
              name: _nameController.text.trim(),
              breed: _breedController.text.trim().isEmpty ? null : _breedController.text.trim(),
              species: _species,
              gender: _gender,
              birthDate: _birthDate,
              weight: _weightController.text.trim().isEmpty
                  ? null
                  : double.tryParse(_weightController.text.trim()),
              photoUrl: _photoUrl,
            ),
          );
    } else {
      await ref.read(myPetsControllerProvider.notifier).updatePet(
            UpdatePetParams(
              id: widget.pet!.id,
              ownerId: widget.pet!.ownerId,
              name: _nameController.text.trim(),
              breed: _breedController.text.trim().isEmpty ? null : _breedController.text.trim(),
              species: _species,
              gender: _gender,
              birthDate: _birthDate,
              weight: _weightController.text.trim().isEmpty
                  ? null
                  : double.tryParse(_weightController.text.trim()),
              photoUrl: _photoUrl,
            ),
          );
    }

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isSaving = ref.watch(myPetsControllerProvider).isLoading || _uploading;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pet == null ? 'Adicionar Pet' : 'Editar Pet'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      width: 96,
                      height: 96,
                      child: _photoUrl != null
                          ? Image.network(_photoUrl!, fit: BoxFit.cover)
                          : Container(
                              color: AppColors.background,
                              child: const Icon(Icons.pets, size: 40, color: AppColors.textSecondary),
                            ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    onPressed: isSaving ? null : _pickPhoto,
                    child: const Text('Selecionar Foto'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                validator: (v) => v == null || v.isEmpty ? 'Informe o nome' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<PetSpecies>(
                initialValue: _species,
                items: const [
                  DropdownMenuItem(value: PetSpecies.dog, child: Text('Cachorro')),
                  DropdownMenuItem(value: PetSpecies.cat, child: Text('Gato')),
                ],
                onChanged: isSaving ? null : (v) => setState(() => _species = v ?? PetSpecies.dog),
                decoration: InputDecoration(
                  labelText: 'Espécie',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<PetGender>(
                initialValue: _gender,
                items: const [
                  DropdownMenuItem(value: PetGender.male, child: Text('Macho')),
                  DropdownMenuItem(value: PetGender.female, child: Text('Fêmea')),
                ],
                onChanged: isSaving ? null : (v) => setState(() => _gender = v),
                decoration: InputDecoration(
                  labelText: 'Sexo',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _breedController,
                decoration: InputDecoration(
                  labelText: 'Raça',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _weightController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Peso (kg)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Data de Nascimento',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: InkWell(
                        onTap: isSaving
                            ? null
                            : () async {
                                final now = DateTime.now();
                                final picked = await showDatePicker(
                                  context: context,
                                  initialDate: _birthDate ?? DateTime(now.year - 1, now.month, now.day),
                                  firstDate: DateTime(1990),
                                  lastDate: now,
                                );
                                if (picked != null) setState(() => _birthDate = picked);
                              },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            _birthDate == null
                                ? 'Selecione'
                                : '${_birthDate!.day.toString().padLeft(2, '0')}/${_birthDate!.month.toString().padLeft(2, '0')}/${_birthDate!.year}',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isSaving ? null : _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: isSaving
                      ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: Colors.white))
                      : const Text(
                          'Salvar',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
