import 'package:flutter/material.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'package:trophy/coinBank/counter.dart';
import 'package:trophy/navBar/navbar.dart';
import 'package:trophy/themes/color_palette.dart';

class GiftPage extends StatelessWidget {
  const GiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'SEND COINS',
        coinCount: 520,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Stack(
            children: [
              // Your background image or decoration
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/sendbg.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ensures content doesn't take the full vertical space
                  children: [
                    const Text(
                      'Use coins as a form of gift to your colleagues to appreciate and support them.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    const SizedBox(height: 180.0), // Adds some space between the text and counter
    Container(
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
    const SizedBox(
    width: 13), // Add some space between coin icon and text
    Text(
    '520', // Display the count
    style: const TextStyle(
    color: Palette.appWhite,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    ),
    ),
    ],
    ),
    ) // Counter widget placed below the text
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(onItemSelected: (index) {
        // Handle navigation item selection
      }),
    );
  }
}
