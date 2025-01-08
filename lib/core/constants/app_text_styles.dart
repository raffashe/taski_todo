import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static double _responsiveFontSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    return baseSize * (screenWidth / 375);
  }

  /// Corpo do texto
  static TextStyle body(BuildContext context) {
    return GoogleFonts.urbanist(
      fontSize: _responsiveFontSize(context, 14),
      fontWeight: FontWeight.w500,
      color: AppColors.stateBlue,
    );
  }

  /// Subtítulo
  static TextStyle subtitle(BuildContext context) {
    return GoogleFonts.urbanist(
      fontSize: _responsiveFontSize(context, 14),
      fontWeight: FontWeight.w600,
      color: AppColors.stateBlue,
    );
  }

  /// Subtítulo (Pesquisa)
  static TextStyle subtitlesearch(BuildContext context) {
    return GoogleFonts.urbanist(
      fontSize: _responsiveFontSize(context, 16),
      fontWeight: FontWeight.w600,
      color: AppColors.statePurple,
    );
  }

  /// Subtítulo do card
  static TextStyle subtitlecard(BuildContext context) {
    return GoogleFonts.urbanist(
      fontSize: _responsiveFontSize(context, 16),
      fontWeight: FontWeight.w700,
      color: AppColors.statePurple,
    );
  }

  /// Título
  static TextStyle title(BuildContext context) {
    return GoogleFonts.urbanist(
      fontSize: _responsiveFontSize(context, 20),
      fontWeight: FontWeight.w700,
      color: AppColors.statePurple,
    );
  }

  static TextStyle titleTrash(BuildContext context) {
    return GoogleFonts.urbanist(
      fontSize: _responsiveFontSize(context, 18),
      fontWeight: FontWeight.w600,
      color: AppColors.fireRed,
    );
  }

  /// Label do botão de criação
  static TextStyle buttonLabel(BuildContext context) {
    return GoogleFonts.urbanist(
      fontSize: _responsiveFontSize(context, 18),
      fontWeight: FontWeight.w600,
      color: AppColors.blue,
    );
  }

  /// Título do campo de entrada
  static TextStyle inputTitle(BuildContext context) {
    return GoogleFonts.urbanist(
      fontSize: _responsiveFontSize(context, 16),
      fontWeight: FontWeight.w600,
      color: AppColors.stateBlue,
    );
  }
}
