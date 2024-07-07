import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String sporttitle;
  final String sportdescription;
  final String sportimageUrl;
  final int sportcoinCount;
  final String type;

  CustomCard({
    required this.sporttitle,
    required this.sportdescription,
    required this.sportimageUrl,
    required this.sportcoinCount,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    // Set background color based on type
    final cardColor = type == 'club'
        ? Color(0xFFF3B679) // Color for clubs
        : Color.fromARGB(248, 245, 225, 210); // Default color for other types

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 160,
            decoration: BoxDecoration(
              color: cardColor, // Use the conditional color
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    sportimageUrl,
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(height: 4),
                  Text(
                    sporttitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                      color: Color(0xFF222222),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    sportdescription,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 12, height: 1.1),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Positioned(
            top: -3,
            right: -3,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF222222),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFFFFFFFF),
                  width: 4,
                  strokeAlign: 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Coin.png',
                    width: 22,
                    height: 22,
                  ),
                  Text(
                    '$sportcoinCount',
                    style: TextStyle(
                      color: Color(0xFFFF09C46),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
