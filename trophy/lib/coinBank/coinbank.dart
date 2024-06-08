import 'package:flutter/material.dart';
import 'package:trophy/navBar/navbar.dart';
import 'package:trophy/coinBank/coin_card.dart'; // Import CoinCard widget
import 'package:trophy/themes/button_styles.dart'; // Import the new styles

class CoinBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.brown,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('COIN BANK', style: TextStyle(color: Colors.brown)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: [
            CoinCard(
              imagePath: 'assets/intro1.png',
              title:
                  'Take your mind off the workload and engage in different tasks to earn coins. ',
              buttonText: 'COINS',
              onPressed: () {
                print('Coin 1 button pressed');
              },
            ),
            CoinCard(
              imagePath: 'assets/coin2.png',
              title: 'Coin 2',
              buttonText: 'Press Coin 2',
              onPressed: () {
                print('Coin 2 button pressed');
              },
            ),
            CoinCard(
              imagePath: 'assets/coin3.png',
              title: 'Coin 3',
              buttonText: 'Press Coin 3',
              onPressed: () {
                print('Coin 3 button pressed');
              },
            ),
            CoinCard(
              imagePath: 'assets/coin4.png',
              title: 'Coin 4',
              buttonText: 'Press Coin 4',
              onPressed: () {
                print('Coin 4 button pressed');
              },
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
