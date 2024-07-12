import 'package:flutter/material.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'package:trophy/Screens/qrcodepage.dart';

class Activitiesdetailspage extends StatelessWidget {
  final String title;
  final String description;
  final int coinCount;
  final String activitiesdetails;
  final String activitiesmainimgUrl;
  final String activitydate;
  final String activitytime;
  final String activityvenue;

  const Activitiesdetailspage({
    required this.title,
    required this.description,
    required this.coinCount,
    required this.activitiesdetails,
    required this.activitiesmainimgUrl,
    required this.activitydate,
    required this.activitytime,
    required this.activityvenue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Activities',
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
                              title,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
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
                                    '$coinCount',
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
                  activitiesmainimgUrl,
                  width: double.infinity,
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    activitiesdetails,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Qrcodepage(
                            title: title,
                            description: description,
                            coinCount: coinCount,
                            activitiesdetails: activitiesdetails,
                            activitiesmainimgUrl: activitiesmainimgUrl,
                            activitydate: activitydate,
                            activitytime: activitytime,
                            activityvenue: activityvenue,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF222222),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          'GOING',
                          style: TextStyle(
                            color: Color(0xFFFF09C46),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
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
