import 'package:flutter_test/flutter_test.dart';
import 'package:pdf/widgets.dart' as pw;

void main() {
  test('PDF document generates bytes', () async {
    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('VetField - Prescrição'),
            pw.SizedBox(height: 8),
            pw.Text('Paciente: Rex'),
            pw.Text('Médico: Dr. Vet'),
            pw.SizedBox(height: 12),
            pw.Text('Posologia: 1 comprimido 2x ao dia'),
          ],
        ),
      ),
    );
    final bytes = await doc.save();
    expect(bytes.isNotEmpty, true);
  });
}
