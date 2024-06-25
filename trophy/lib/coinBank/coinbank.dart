import 'package:flutter/material.dart';
// import 'package:trophy/navBar/navbar.dart';
import 'package:trophy/coinBank/coin_card.dart'; // Import CoinCard widget
// import 'package:trophy/themes/button_styles.dart'; // Import the new styles
import 'package:trophy/coinBank/counter.dart';

import '../themes/color_palette.dart'; // Import the Counter widget
import 'package:trophy/coinBank/coins.dart'; // Import CoinsPage
import 'package:trophy/coinBank/redeem.dart'; // Import RedeemPage
import 'package:trophy/coinBank/gift.dart'; // Import GiftPage
import 'package:trophy/coinBank/spin.dart'; // Import SpinPage

class CoinBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Palette.appBrown,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:
            const Text('COIN BANK', style: TextStyle(color: Palette.appBrown)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Counter(count: 520), // Use the Counter widget

            SizedBox(
                height: 30), // Add some space between the counter and the grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 90.0,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.8, // Adjust as needed
                    child: CoinCard(
                      title:
                          'Take your mind off the workload and engage in different tasks to earn coins.',
                      buttonText: 'COINS',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CoinsPage()),
                        );
                      },
                      backgroundImage: 'assets/bg1.png',
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.4, // Adjust as needed
                    child: CoinCard(
                      title:
                          'Redeem the coins you’ve earned in the form of cash at checkouts.',
                      buttonText: 'REDEEM',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RedeemPage()),
                        );
                      },
                      backgroundImage: 'assets/bg2.png',
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.4, // Adjust as needed
                    child: CoinCard(
                      title:
                          'Use coins as a form of gift to your colleagues to appreciate and support them.',
                      buttonText: 'GIFT',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GiftPage()),
                        );
                      },
                      backgroundImage: 'assets/bg3.png',
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.4, // Adjust as needed
                    child: CoinCard(
                      title:
                          'Let the lucky spinning wheel bring you more coins.',
                      buttonText: 'SPIN',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SpinPage()),
                        );
                      },
                      backgroundImage: 'assets/bg4.png',
                    ),
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
