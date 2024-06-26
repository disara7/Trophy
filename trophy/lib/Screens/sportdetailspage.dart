import 'package:flutter/material.dart';
import 'package:trophy/Components/custom_app_bar.dart';

class SportDetailsPage extends StatelessWidget {
  final String sportTitle;
  final int sportCoinCount;
  final String sportDescription;
  final String sportdetails;
  final String sportmainimgUrl;

  const SportDetailsPage({
    required this.sportTitle,
    required this.sportCoinCount,
    required this.sportDescription,
    required this.sportdetails,
    required this.sportmainimgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'SPORTS',
        coinCount: 500,
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              sportTitle,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              sportDescription,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Text(
                                    '$sportCoinCount',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                          ),
                          Positioned(
                            top: -15,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Image.asset(
                                'assets/Coin.png',
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  sportmainimgUrl,
                  width: double.infinity,
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    sportdetails,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF222222),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        'REGISTER NOW',
                        style: TextStyle(
                          color: Color(0xFFFF09C46),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
