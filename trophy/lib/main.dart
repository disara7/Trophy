import 'package:flutter/material.dart';

import 'package:trophy/coinBank/coinbank.dart';

// import 'package:trophy/coinBank/coinbank.dart';
// import 'package:trophy/navBar/navbar.dart';
// import 'package:trophy/splash/splash.dart';
// import 'package:trophy/Screens/Authentication.dart';

import 'package:trophy/Screens/blog.dart';
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


      home: AuthCheck(),
      // home: Blog(),

    );
  }
}
