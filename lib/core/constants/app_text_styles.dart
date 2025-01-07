import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  /// Corpo do texto
  static final TextStyle body = GoogleFonts.urbanist(
    fontSize: 14,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.stateBlue,
  );

  /// Subtítulo
  static final TextStyle subtitle = GoogleFonts.urbanist(
    fontSize: 16,
    fontWeight: FontWeight.w600, // SemiBold
    color: AppColors.stateBlue,
  );

  /// Subtítulo
  static final TextStyle subtitlesearch = GoogleFonts.urbanist(
    fontSize: 16,
    fontWeight: FontWeight.w600, // SemiBold
    color: AppColors.statePurple,
  );

  /// Subtitulo card
  static final TextStyle subtitlecard = GoogleFonts.urbanist(
    fontSize: 16,
    fontWeight: FontWeight.w700, // SemiBold
    color: AppColors.statePurple,
  );

  /// Título
  static final TextStyle title = GoogleFonts.urbanist(
    fontSize: 20,
    fontWeight: FontWeight.w700, // Bold
    color: AppColors.statePurple,
  );
  static final TextStyle titleTrash = GoogleFonts.urbanist(
    fontSize: 18,
    fontWeight: FontWeight.w600, // Bold
    color: AppColors.fireRed,
  );

  /// Label botão criação
  static final TextStyle buttonLabel = GoogleFonts.urbanist(
    fontSize: 18,
    fontWeight: FontWeight.w600, // SemiBold
    color: AppColors.blue,
  );
}
