import 'package:flutter/material.dart';

class RedeemPage extends StatelessWidget {
  const RedeemPage({super.key});

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
                  width: 350,
                  // height: 250, // Adjust image height
                ),
              ),
              Positioned(
                left: 120,
                top: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 220, // Set the desired width
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
