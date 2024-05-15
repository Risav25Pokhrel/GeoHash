import 'package:flutter/material.dart';
import 'package:geohash/core/services/get.dart';
import 'package:google_fonts/google_fonts.dart';


abstract final class AppTextStyles {
  /// Text style for heading 1 text
  static final TextStyle displayLarge =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w700).px28;

  /// Text style for heading 2 text
  static final TextStyle displayMedium =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w600).px17;

  /// Text style for heading 3 text
  static final TextStyle displaySmall =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w600).px14;

  /// Text style for heading 4 text
  static final TextStyle headlineMedium =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w600).px15;

  /// Text style for large body text
  static final TextStyle bodyLarge =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w700).px22;

  //Text style for body text
  static final TextStyle bodyMedium =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w600).px16;

  //Text style for small body//subtitle 1
  static final TextStyle titleMedium =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w400).px16;

  static final TextStyle titleLarge =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w500).px16;

//Text style for extrasmall body//subtitle 2
  static final TextStyle titleSmall =
      GoogleFonts.openSans(fontWeight: FontWeight.w600).px12;

  static final TextStyle headlineLarge =
      GoogleFonts.roboto(fontWeight: FontWeight.w600).px20;
}
