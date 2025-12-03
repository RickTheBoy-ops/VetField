import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:signature/signature.dart';
import '../../../../core/theme/app_colors.dart';

class PrescriptionScreen extends ConsumerStatefulWidget {
  final String appointmentId;
  const PrescriptionScreen({super.key, required this.appointmentId});

  @override
  ConsumerState<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends ConsumerState<PrescriptionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _patientController = TextEditingController();
  final _medsController = TextEditingController();
  final _notesController = TextEditingController();
  final _signatureController = SignatureController(penStrokeWidth: 3, penColor: Colors.black);

  Future<void> _generatePdf() async {
    if (!_formKey.currentState!.validate()) return;
    Uint8List? signatureBytes = await _signatureController.toPngBytes();
    final doc = pw.Document();
    final signatureImage = signatureBytes != null ? pw.MemoryImage(signatureBytes) : null;
    doc.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Receituário VetField', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 12),
              pw.Text('Paciente: ${_patientController.text}'),
              pw.SizedBox(height: 8),
              pw.Text('Medicamentos:'),
              pw.Text(_medsController.text),
              pw.SizedBox(height: 8),
              pw.Text('Observações:'),
              pw.Text(_notesController.text),
              pw.SizedBox(height: 24),
              if (signatureImage != null) pw.Image(signatureImage, height: 80),
              pw.SizedBox(height: 8),
              pw.Text('Assinatura digital'),
            ],
          );
        },
      ),
    );
    await Printing.layoutPdf(onLayout: (format) async => await doc.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receituário Digital'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        actions: [
          IconButton(onPressed: _generatePdf, icon: const Icon(Icons.picture_as_pdf_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _patientController,
                decoration: const InputDecoration(labelText: 'Paciente'),
                validator: (v) => v == null || v.isEmpty ? 'Informe o paciente' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _medsController,
                decoration: const InputDecoration(labelText: 'Medicamentos'),
                maxLines: 4,
                validator: (v) => v == null || v.isEmpty ? 'Informe medicamentos' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(labelText: 'Observações'),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              const Align(alignment: Alignment.centerLeft, child: Text('Assinatura')), 
              const SizedBox(height: 8),
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Signature(controller: _signatureController, backgroundColor: Colors.white),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  OutlinedButton(onPressed: _signatureController.clear, child: const Text('Limpar')),
                  const SizedBox(width: 12),
                  ElevatedButton(onPressed: _generatePdf, child: const Text('Gerar PDF')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
