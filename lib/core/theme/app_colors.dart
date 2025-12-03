import 'package:flutter/material.dart';

/// Cores do Design System VetField
class AppColors {
  // Cores Primárias
  static const primary = Color(0xFF0D9488); // Verde Teal
  static const secondary = Color(0xFF8B5CF6); // Roxo
  
  // Backgrounds
  static const background = Color(0xFFF9FAFB); // Off-white/Cinza muito claro
  static const cardBackground = Colors.white;
  
  // Textos
  static const textPrimary = Color(0xFF111827); // Quase preto
  static const textSecondary = Color(0xFF6B7280); // Cinza médio
  
  // Bordas e Divisores
  static const border = Color(0xFFE5E7EB); // Cinza claro
  
  // Status e Feedback
  static const success = Color(0xFF10B981);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);
  static const info = Color(0xFF3B82F6);
  
  // Cores de Rating
  static const starColor = Color(0xFFFACC15); // Amarelo estrela
  
  // Gradientes (para usar em BoxDecoration)
  static const primaryGradient = LinearGradient(
    colors: [Color(0xFF0D9488), Color(0xFF14B8A6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const secondaryGradient = LinearGradient(
    colors: [Color(0xFF8B5CF6), Color(0xFFA78BFA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Overlays e Sombras
  static Color shadowColor = const Color(0xFF0D9488).withValues(alpha: 0.2);
  static Color cardShadow = Colors.black.withValues(alpha: 0.05);
}
