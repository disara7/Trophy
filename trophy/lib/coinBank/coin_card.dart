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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                height: 60,
              ),
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyles.elevatedButtonStyle,
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
