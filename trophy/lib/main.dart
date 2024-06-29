import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trophy/Screens/activities.dart';
import 'package:trophy/coinBank/RedeemOptionsCarousel.dart';

import 'package:trophy/coinBank/coinbank.dart';
import 'package:trophy/coinBank/coins.dart';
import 'package:trophy/coinBank/spin.dart';
import 'package:trophy/coinBank/redeem.dart';
import 'package:trophy/splash/intro.dart';
// import 'package:trophy/coinBank/coinbank.dart';
// import 'package:trophy/navBar/navbar.dart';
// import 'package:trophy/splash/splash.dart';
// import 'package:trophy/Screens/Authentication.dart';
import 'package:trophy/themes/theme.dart';

import 'Screens/Therapy/therapy_home.dart';
import 'blocs/therapy/category/category_bloc.dart';

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

      home: const IntroScreen(),


    );
  }
}
