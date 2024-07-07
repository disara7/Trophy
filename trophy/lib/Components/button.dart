import 'package:flutter/material.dart';

Widget customButton({
  required Color backgroundColor,
  required Color textColor,
  required String text,
  VoidCallback? onPressed,
  IconData? icon,
  double iconSize = 24.0,
}) {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              size: iconSize,
              color: textColor,
            ),
          if (icon != null)
            const SizedBox(width: 5.0),
          Text(
            text,
            style: TextStyle(fontSize: 16.0, color: textColor),
          ),
        ],
      ),
    ),
  );
}



Widget trophyButton(
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
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: -32.0,
            top: -43.0,
            child: Image.asset(
              'assets/Home/Trophy.png',
              width: 85.0,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 16.0, color: textColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
