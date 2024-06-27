import 'package:flutter/material.dart';

Widget customButton(
    Color backgroundColor,
    Color textColor,
    String text,
    VoidCallback onPressed,
    ) {
  return Expanded(
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.0, color: textColor),
      ),
    ),
  );
}
