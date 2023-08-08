import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  final TextStyle heading = GoogleFonts.nunito(
    color: Colors.white,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  final TextStyle subheading = GoogleFonts.nunito(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  final TextStyle body = GoogleFonts.nunito(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  final TextStyle buttons = GoogleFonts.nunito(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  final TextStyle superSmall = GoogleFonts.nunito(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
}
