import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/services/vaccine_ocr_service.dart';
import '../../../../core/theme/app_colors.dart';

class VaccineScannerScreen extends ConsumerStatefulWidget {
  const VaccineScannerScreen({super.key});

  @override
  ConsumerState<VaccineScannerScreen> createState() => _VaccineScannerScreenState();
}

class _VaccineScannerScreenState extends ConsumerState<VaccineScannerScreen> {
  final ImagePicker _picker = ImagePicker();
  final VaccineOCRService _ocrService = VaccineOCRService();
  
  bool _isProcessing = false;
  File? _selectedImage;

  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
      await _processImage(File(image.path));
    }
  }

  Future<void> _pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
      await _processImage(File(image.path));
    }
  }

  Future<void> _processImage(File imageFile) async {
    setState(() {
      _isProcessing = true;
    });

    try {
      final inputImage = InputImage.fromFile(imageFile);
      final vaccineData = await _ocrService.extractVaccineData(inputImage);

      if (!mounted) return;

      if (vaccineData != null && (vaccineData.name != null || vaccineData.date != null)) {
        // Show confirmation dialog
        _showConfirmationDialog(vaccineData);
      } else {
        _showErrorDialog('Não foi possível identificar dados da vacina na imagem.');
      }
    } catch (e) {
      if (!mounted) return;
      _showErrorDialog('Erro ao processar imagem: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  void _showConfirmationDialog(VaccineData data) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Dados da Vacina Identificados'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (data.name != null) ...[
              const Text(
                'Vacina:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(data.name!),
              const SizedBox(height: 12),
            ],
            if (data.date != null) ...[
              const Text(
                'Data:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${data.date!.day}/${data.date!.month}/${data.date!.year}'),
              const SizedBox(height: 12),
            ],
            const Text(
              'Deseja adicionar este registro de saúde?',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigate to add health event screen with pre-filled data
              // TODO: Integrate with existing HealthRepository
              context.pop(); // Go back after saving
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Vacina adicionada com sucesso!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Erro'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _ocrService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escanear Cartão de Vacina'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_selectedImage != null) ...[
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: FileImage(_selectedImage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ] else ...[
                  Icon(
                    Icons.document_scanner,
                    size: 120,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Escaneie o cartão de vacina do seu pet',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _isProcessing ? null : _pickImageFromCamera,
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('Câmera'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: _isProcessing ? null : _pickImageFromGallery,
                      icon: const Icon(Icons.photo_library),
                      label: const Text('Galeria'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (_isProcessing)
            Container(
              color: Colors.black54,
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(color: Colors.white),
                    SizedBox(height: 16),
                    Text(
                      'Processando imagem...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
}
