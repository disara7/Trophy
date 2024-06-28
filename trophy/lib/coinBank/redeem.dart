import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trophy/coinBank/RedeemOptionsCarousel.dart';
import 'package:trophy/coinBank/amount_selector.dart';
import 'package:trophy/coinBank/counter.dart';

class RedeemPage extends StatefulWidget {
  const RedeemPage({Key? key}) : super(key: key);

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
          padding: EdgeInsets.all(0.0), // Add padding inside the container
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
                    Container(
                      width: 230, // Set the desired width
                      child: RichText(
                        text: TextSpan(
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
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 350,
                          child: Counter(count: 520),
                        ),
                        SizedBox(height: 20), // Adjust space as needed
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Select Amount to Redeem',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        AmountSelector(
                          initialAmount: amount,
                          onAmountChanged: _onAmountChanged,
                          onRedeem: _onRedeem,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Positioned(
              //   left: 0,
              //   top: 140,
              //   child:
              //       RedeemOptionsCarousel(), // Adjust carousel position as needed
              // ),
              Positioned(
                left: 0,
                top: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 350,
                      child: Counter(count: 520),
                    ),
                    SizedBox(height: 20), // Adjust space as needed
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Select Amount to Redeem',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    AmountSelector(
                      initialAmount: amount,
                      onAmountChanged: _onAmountChanged,
                      onRedeem: _onRedeem,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}