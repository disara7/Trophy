import 'package:flutter/material.dart';
import 'package:trophy/themes/button_styles.dart';

class CoinCard extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onPressed;
  final String backgroundImage;

  CoinCard({
    required this.title,
    required this.buttonText,
    required this.onPressed,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // Make container background transparent
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.fitWidth,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 130, horizontal: 12),
            child: SizedBox.shrink(), // Empty widget to hold background image
          ),
          Padding(
            padding:
                const EdgeInsets.fromLTRB(12, 0, 12, 0), // Adjusted padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ButtonStyles.elevatedButtonStyle.copyWith(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(vertical: 10),
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
