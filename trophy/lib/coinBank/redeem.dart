import 'package:flutter/material.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'package:trophy/coinBank/amount_selector.dart';
import 'package:trophy/coinBank/counter.dart';
import 'package:trophy/coinBank/RedeemOptionsCarousel.dart';
import 'package:trophy/navBar/navbar.dart'; // Adjust the path as per your project structure

class RedeemPage extends StatefulWidget {
  const RedeemPage({super.key});

  @override
  _RedeemPageState createState() => _RedeemPageState();
}

class _RedeemPageState extends State<RedeemPage> {
  int coinCount = 520; // Current coin count
  int amount = 0; // Amount selected to redeem

  void _onAmountChanged(int newAmount) {
    setState(() {
      amount = newAmount;
    });
  }

  void _onRedeem(int redeemedAmount) {
    setState(() {
      coinCount -= redeemedAmount;
      if (coinCount < 0) {
        coinCount = 0; // Prevent negative coin count
      }
    });
    // Optionally add further redeem logic here
    print('Redeem $redeemedAmount coins');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'REDEEM COINS',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Your existing Stack with image and text
                Stack(
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                      child: Image.asset(
                        'assets/redeemcat.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(115, 20, 5, 0),
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'The effort pays off!\n',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                  'It’s about time you make use of the coins you’ve collected. Redeem the coins you have collected at the checkout of the following.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Your existing RedeemOptionsCarousel widget
                const RedeemOptionsCarousel(),

                const SizedBox(height: 20),

                // Your existing Counter widget
                Counter(count: coinCount), // Update coin count here

                const SizedBox(height: 20),

                // Text widget for 'Select Amount to Redeem'
                const Text(
                  'Select Amount to Redeem',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                // Integrate AmountSelector widget here
                AmountSelector(
                  initialAmount: amount,
                  onAmountChanged: _onAmountChanged,
                  onRedeem: _onRedeem, // Pass redeem function
                ),

                // Your existing Container with text and image
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/countbg.png'), // Set the background image
                      fit: BoxFit.contain, // Adjust as needed (cover, contain, etc.)
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'COLLECT MORE!',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Find ways to collect more coins',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/cb1.png', // Replace with your image path
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(onItemSelected: (index) {
        // Handle navigation item selection
      }),
    );
  }
}
