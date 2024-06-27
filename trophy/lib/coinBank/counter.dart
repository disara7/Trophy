import 'package:flutter/material.dart';

import '../themes/color_palette.dart';

class Counter extends StatelessWidget {
  final int count;

  const Counter({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/countbg.png'), // Background image
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Coin.png', // Coin icon
            width: 32,
            height: 32,
          ),
          const SizedBox(width: 13), // Add some space between coin icon and text
          Text(
            '$count', // Display the count
            style: const TextStyle(
              color: Palette.appWhite,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
