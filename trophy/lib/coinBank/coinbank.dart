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
          padding: const EdgeInsets.all(10.0),
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
        padding: const EdgeInsets.fromLTRB(15, 50, 15, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 76,
              decoration: BoxDecoration(
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
                    // You can adjust width and height as needed
                  ),
                  SizedBox(
                      width: 13), // Add some space between coin icon and text
                  Text(
                    '520', // You can replace it with your text
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
                height:
                    20), // Add some space between the black box and the grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 60.0,
                children: [
                  CoinCard(
                    title:
                        'Take your mind off the workload and engage in different tasks to earn coins. ',
                    buttonText: 'COINS',
                    onPressed: () {
                      print('Coin 1 button pressed');
                    },
                    backgroundImage:
                        'assets/bg1.png', // Background image for card 1
                  ),
                  CoinCard(
                    title:
                        'Redeem the coins you’ve earned in the form of cash at checkouts. ',
                    buttonText: 'REDEEM',
                    onPressed: () {
                      print('Coin 2 button pressed');
                    },
                    backgroundImage:
                        'assets/bg2.png', // Background image for card 2
                  ),
                  CoinCard(
                    title:
                        'Use coins as a form of gift to your colleagues to appreciate and support them.',
                    buttonText: 'GIFT',
                    onPressed: () {
                      print('Coin 3 button pressed');
                    },
                    backgroundImage:
                        'assets/bg3.png', // Background image for card 3
                  ),
                  CoinCard(
                    title: 'Let the lucky spinning wheel bring you more coins.',
                    buttonText: 'SPIN',
                    onPressed: () {
                      print('Coin 4 button pressed');
                    },
                    backgroundImage:
                        'assets/bg4.png', // Background image for card 4
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
