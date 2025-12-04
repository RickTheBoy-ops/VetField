import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class VaccineOCRService {
  final textRecognizer = TextRecognizer();

  Future<VaccineData?> extractVaccineData(InputImage inputImage) async {
    try {
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
      
      String fullText = recognizedText.text;
      
      // Extract vaccine name
      String? vaccineName = _extractVaccineName(fullText);
      
      // Extract date
      DateTime? vaccineDate = _extractDate(fullText);
      
      if (vaccineName != null || vaccineDate != null) {
        return VaccineData(
          name: vaccineName,
          date: vaccineDate,
          rawText: fullText,
        );
      }
      
      return null;
    } catch (e) {
      return null;
    }
  }

  String? _extractVaccineName(String text) {
    final vaccines = [
      'Raiva',
      'V8',
      'V10',
      'Giárdia',
      'Giardia',
      'Leishmaniose',
      'Antirrábica',
      'Polivalente',
      'Gripe Canina',
    ];

    for (var vaccine in vaccines) {
      if (text.toUpperCase().contains(vaccine.toUpperCase())) {
        return vaccine;
      }
    }

    // Try to find "Vacina" + word after
    final vaccineRegex = RegExp(r'Vacina\s+(\w+)', caseSensitive: false);
    final match = vaccineRegex.firstMatch(text);
    if (match != null && match.groupCount > 0) {
      return match.group(1);
    }

    return null;
  }

  DateTime? _extractDate(String text) {
    // Try formats: dd/MM/yyyy, dd-MM-yyyy, dd.MM.yyyy
    final datePatterns = [
      RegExp(r'(\d{2})[\/\-\.](\d{2})[\/\-\.](\d{4})'),
      RegExp(r'(\d{1,2})[\/\-\.](\d{1,2})[\/\-\.](\d{4})'),
    ];

    for (var pattern in datePatterns) {
      final match = pattern.firstMatch(text);
      if (match != null && match.groupCount >= 3) {
        try {
          final day = int.parse(match.group(1)!);
          final month = int.parse(match.group(2)!);
          final year = int.parse(match.group(3)!);
          
          if (day >= 1 && day <= 31 && month >= 1 && month <= 12) {
            return DateTime(year, month, day);
          }
        } catch (e) {
          continue;
        }
      }
    }

    return null;
  }

  void dispose() {
    textRecognizer.close();
  }
}

class VaccineData {
  final String? name;
  final DateTime? date;
  final String rawText;

  VaccineData({
    this.name,
    this.date,
    required this.rawText,
  });
}
