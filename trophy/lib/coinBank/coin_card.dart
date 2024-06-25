import 'package:flutter/material.dart';
import 'package:trophy/themes/button_styles.dart';
import 'coins.dart'; // Import the CoinsPage widget

class CoinCard extends StatelessWidget {
  final String title;
  final String buttonText;
  final String backgroundImage;

  CoinCard({
    required this.title,
    required this.buttonText,
    required this.backgroundImage,
    required Null Function() onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1, // Adjust aspect ratio as needed
            child: Image.asset(
              backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 55,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CoinsPage()),
                    );
                  },
                  style: ButtonStyles.elevatedButtonStyle.copyWith(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
