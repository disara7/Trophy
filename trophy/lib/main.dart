import 'package:flutter/material.dart';
import 'package:trophy/authcheck.dart';
import 'package:trophy/themes/theme.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TrophyTheme.lightTheme,
      darkTheme: TrophyTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const AuthCheck(),
    );
  }
}
