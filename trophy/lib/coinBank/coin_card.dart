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
            fit: BoxFit.fitWidth, // Use fitWidth to fill the container width
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.fromLTRB(20, 80, 20, 20), // Increased padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12, // Increased font size
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10), // Increased sized box height
              ElevatedButton(
                onPressed: onPressed,
                style: ButtonStyles.elevatedButtonStyle.copyWith(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(
                        vertical: 15), // Increased button padding
                  ),
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(fontSize: 16), // Increased button text size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
