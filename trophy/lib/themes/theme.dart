import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_palette.dart';

class TrophyTheme {
  TrophyTheme._();
  static ThemeData lightTheme = ThemeData(
      primarySwatch: Palette.appOrange,
      scaffoldBackgroundColor: const Color(0xFFfdfeff),
      brightness: Brightness.light,
      textTheme: TextTheme(
          displayLarge: GoogleFonts.roboto(
            color: Colors.black38,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            height: 1,
          ),
          displayMedium: GoogleFonts.roboto(
            color: Colors.black38,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 1,
          ),
          displaySmall: GoogleFonts.roboto(
            color: Colors.black38,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1,
          ),
          headlineLarge: GoogleFonts.roboto(
            color: Colors.black38,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1,
          )));

  static ThemeData darkTheme = ThemeData();
}
