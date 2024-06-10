import 'package:flutter/material.dart';
import 'package:trophy/themes/button_styles.dart';

class CoinCard extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onPressed;
  final String backgroundImage; // New parameter for background image

  CoinCard({
    required this.title,
    required this.buttonText,
    required this.onPressed,
    required this.backgroundImage, // Initialize background image
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0, // Set elevation to 0 to remove shadow
      color: Colors.transparent, // Make card background transparent
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage), // Use provided background image
            fit: BoxFit.contain,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 100, 40, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 9,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomCenter, // Align button to the bottom
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ButtonStyles.elevatedButtonStyle,
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
