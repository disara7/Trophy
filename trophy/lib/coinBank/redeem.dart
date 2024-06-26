import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trophy/coinBank/RedeemOptionsCarousel.dart';
import 'package:trophy/coinBank/counter.dart';

class RedeemPage extends StatelessWidget {
  const RedeemPage({Key? key}) : super(key: key);

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
                    SizedBox(
                      height: 20,
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
                child: Container(
                  width: 350,
                  child: Counter(count: 520),
                ), // Adjust carousel position as needed
              ),
            ],
          ),
        ),
      ),
    );
  }
}
