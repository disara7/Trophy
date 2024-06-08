import 'package:flutter/material.dart';
import 'package:trophy/themes/button_styles.dart';

class CoinCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String buttonText;
  final VoidCallback onPressed;

  CoinCard({
    required this.imagePath,
    required this.title,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: onPressed,
                style: ButtonStyles.elevatedButtonStyle,
                child: Text(buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
