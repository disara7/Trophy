import 'package:flutter/material.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'package:trophy/coinBank/counter.dart';
import 'package:trophy/navBar/navbar.dart';
import 'package:trophy/themes/color_palette.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'LEADER BOARD',
        coinCount: 520,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(8.0),

        ),
      ),
      bottomNavigationBar: BottomNavBar(onItemSelected: (index) {
        // Handle navigation item selection
      }),
    );
  }
}
