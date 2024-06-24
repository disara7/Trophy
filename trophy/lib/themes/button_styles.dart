import 'package:flutter/material.dart';

import 'color_palette.dart';

class ButtonStyles {
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Palette.appBlack, // Background color
    foregroundColor: Palette.appOrange, // Text color
    padding:
      const EdgeInsets.symmetric(horizontal: 14, vertical: 8), // Adjust padding
    minimumSize: const Size(0, 40), // Set minimum height
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold, // Make text bold
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}
