import 'package:flutter/material.dart';
import 'package:trophy/themes/button_styles.dart';

import '../themes/color_palette.dart';

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
      decoration: const BoxDecoration(
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
                const SizedBox(
                  height: 55,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Palette.appBlack,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ButtonStyles.elevatedButtonStyle.copyWith(
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(fontSize: 16),
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
