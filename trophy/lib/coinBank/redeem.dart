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
                  'assets/redeemcat.png', // Replace with your image asset path
                  width: 350, // Adjust image width
                  // height: 250, // Adjust image height
                ),
              ),
              Positioned(
                left: 120,
                top: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The effort pays off!',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      'It’s about time you make use of the coins you’ve collected. Redeem the coins you have collected at the checkout of the following. ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
