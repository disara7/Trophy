import 'package:flutter/material.dart';
import 'package:trophy/coinBank/RedeemOptionsCarousel.dart';
import 'package:trophy/coinBank/amount_selector.dart';
import 'package:trophy/coinBank/counter.dart';
import 'package:trophy/navBar/navbar.dart';

class RedeemPage extends StatefulWidget {
  const RedeemPage({super.key});

  @override
  _RedeemPageState createState() => _RedeemPageState();
}

class _RedeemPageState extends State<RedeemPage> {
  int amount = 0;

  void _onAmountChanged(int newAmount) {
    setState(() {
      amount = newAmount;
    });
  }

  void _onRedeem() {
    // Add your redeem action here
    print('Redeem $amount coins');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REDEEM COINS'),
      ),
      body: Center(
        child: Container(
          width: 350, // Set width as needed
          padding:
              const EdgeInsets.all(0.0), // Add padding inside the container
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 40,
                child: Image.asset(
                  'assets/redeemcat.png',
                  width: 360,
                  // height: 250, // Adjust image height
                ),
              ),
              Positioned(
                left: 115,
                top: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 230, // Set the desired width
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'The effort pays off!',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' It’s about time you make use of the coins you’ve collected. Redeem the coins you have collected at the checkout of the following.',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                top: 140,
                child:
                    RedeemOptionsCarousel(), // Adjust carousel position as needed
              ),
              Positioned(
                left: 0,
                top: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 350,
                      child: Counter(count: 520),
                    ),
                    const SizedBox(height: 20), // Adjust space as needed
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Select Amount to Redeem',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    AmountSelector(
                      initialAmount: amount,
                      onAmountChanged: _onAmountChanged,
                      onRedeem: _onRedeem,
                    ),
                  ],
                ),
              ),
              // Add the new black box here
              Positioned(
                left: 0,
                top: 500, // Adjust the position as needed
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'First Orange Text',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Second Orange Text',
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
                        width: 50, // Adjust width as needed
                        height: 50, // Adjust height as needed
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
