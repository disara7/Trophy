import 'package:flutter/material.dart';
import 'package:trophy/Screens/Authentication.dart';

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
        scaffoldBackgroundColor: const Color(0xFFFDFEFF),
      ),
      home: const AuthPage(),
    );
  }
}
