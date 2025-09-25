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

}