import 'package:flutter/material.dart';
import 'package:trophy/navBar/navbar.dart';
import 'package:trophy/splash/splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFDFEFF),
      ),
      home: SplashScreen(),
    );
  }
}
