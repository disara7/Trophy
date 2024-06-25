import 'package:flutter/material.dart';
import 'package:trophy/splash/intro.dart';

import '../themes/color_palette.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(
        const Duration(seconds: 3), () {}); // Duration of the splash screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => IntroScreen()), // Replace with your main screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Palette.appWhite, // Background color of the splash screen
      body: Center(
        child: Image.asset(
          'assets/logo.png', // Path to the logo image
          width: 200, // Adjust the width as needed
          height: 200, // Adjust the height as needed
        ),
      ),
    );
  }
}
