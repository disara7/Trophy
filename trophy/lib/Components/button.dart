import 'package:flutter/material.dart';
import 'package:trophy/Leaderboard/ladder.dart';

Widget customButton({
  required Color backgroundColor,
  required Color textColor,
  required String text,
  VoidCallback? onPressed,
  IconData? icon,
  double iconSize = 20.0,
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
            const SizedBox(width: 10.0),
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
    BuildContext context, // Pass context as a parameter
    Color backgroundColor,
    Color textColor,
    String text,
    VoidCallback onPressed,
    ) {
  return Expanded(
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Ladder()), // Navigate to Ladder
        );
      },
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



Widget discoverBtn({
  required String optionText,
  required String countText,
  VoidCallback? onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF222222),
      foregroundColor: const Color.fromARGB(255, 240, 156, 70),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    child: Row(
      children: [
        Text(
          optionText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10.0),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(100, 240, 156, 70),
                shape: BoxShape.circle,
              ),
            ),
            Text(
              countText,
              style: const TextStyle(
                color: Color.fromARGB(255, 240, 156, 70),
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

