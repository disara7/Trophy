import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trophy/blocs/coinbank/coinbank_bloc.dart';
import 'package:trophy/coinBank/counter.dart';
import 'package:trophy/coinBank/coins.dart';
import 'package:trophy/coinBank/gift.dart';
import 'package:trophy/coinBank/redeem.dart';
import 'package:trophy/coinBank/spin.dart';
import 'package:trophy/navBar/navbar.dart';
import 'package:trophy/themes/color_palette.dart';

class CoinBank extends StatelessWidget {
  const CoinBank({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoinBankBloc(),
      child: const CoinBankContent(),
    );
  }
}

class CoinBankContent extends StatelessWidget {
  const CoinBankContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon: const Icon(
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
        title: const Text('COIN BANK', style: TextStyle(color: Colors.brown)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlocBuilder<CoinBankBloc, int>(
              builder: (context, count) {
                return Counter(count: count); // Pass count to Counter widget
              },
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCardWithBackground(
                        'assets/bg1.png',
                        'Take your mind off the workload and engage in different tasks to earn coins.',
                        'COINS',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CoinsPage()),
                          );
                        },
                      ),
                      _buildCardWithBackground(
                        'assets/bg2.png',
                        'Redeem the coins you’ve earned in the form of cash at checkouts.',
                        'REDEEM',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RedeemPage()),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCardWithBackground(
                        'assets/bg3.png',
                        'Use coins as a form of gift to your colleagues to appreciate and support them.',
                        'GIFT',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GiftPage()),
                          );
                        },
                      ),
                      _buildCardWithBackground(
                        'assets/bg4.png',
                        'Let the lucky spinning wheel bring you more coins.',
                        'SPIN',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SpinPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(onItemSelected: (index) {
        // Handle navigation item selection
      }),
    );
  }

  Widget _buildCardWithBackground(String backgroundImage, String text,
      String buttonText, VoidCallback onPressed) {
    final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Palette.appBlack,
      foregroundColor: Palette.appOrange,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      minimumSize: const Size(130, 20),
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    );

    return Container(
      height: 300,
      width: 160,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.contain,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 110),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                ElevatedButton(
                  onPressed: onPressed,
                  style: elevatedButtonStyle,
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
