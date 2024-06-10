import 'package:flutter/material.dart';

class ButtonStyles {
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.black, // Background color
    foregroundColor: Colors.orange, // Text color
    padding:
        EdgeInsets.symmetric(horizontal: 14, vertical: 8), // Adjust padding
    minimumSize: Size(0, 40), // Set minimum height
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold, // Make text bold
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}
