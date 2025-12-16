import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppFonts {

  static TextStyle buildScreenHeading({Color color = AppColors.primaryBlack}) {
    return GoogleFonts.nunito(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: color,
    );
  }

  static TextStyle buildCategoryHeading({Color color = AppColors.primaryBlack}) {
    return GoogleFonts.nunito(
      fontWeight: FontWeight.w900,
      fontSize: 20,
      color: color,
    );
  }

  static TextStyle buildCategoryDescription({Color color = AppColors.primaryBlack}) {
    return GoogleFonts.nunito(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: color,
    );
  }

  static TextStyle buildConfidencePercent({Color color = AppColors.primaryBlack}) {
    return GoogleFonts.nunito(
      fontWeight: FontWeight.normal,
      fontSize: 20,
      color: color,
    );
  }

  static TextStyle buildInputLabel({Color color = AppColors.primaryBlack}) {
    return GoogleFonts.nunito(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: color,
    );
  }

}