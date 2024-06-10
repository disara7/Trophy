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
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 5),
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
                    30), // Add some space between the black box and the grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 80.0,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.8, // Adjust as needed
                    child: CoinCard(
                      title:
                          'Take your mind off the workload and engage in different tasks to earn coins. ',
                      buttonText: 'COINS',
                      onPressed: () {
                        print('Coin 1 button pressed');
                      },
                      backgroundImage: 'assets/bg1.png',
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.4, // Adjust as needed
                    child: CoinCard(
                      title:
                          'Redeem the coins you’ve earned in the form of cash at checkouts. ',
                      buttonText: 'REDEEM',
                      onPressed: () {
                        print('Coin 1 button pressed');
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
                        print('Coin 1 button pressed');
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
                        print('Coin 1 button pressed');
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
