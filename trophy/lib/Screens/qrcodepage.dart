import 'package:flutter/material.dart';
import 'package:trophy/Components/custom_app_bar.dart';

class Qrcodepage extends StatelessWidget {
  final String title;
  final String description;
  final int coinCount;
  final String activitiesdetails;
  final String activitiesmainimgUrl;
  final String activitydate;
  final String activitytime;
  final String activityvenue;

  const Qrcodepage({super.key, 
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                color: const Color(0xFF222222),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Image.asset(
                        'assets/Qrcode.png',
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180.0, // Adjust this value to move content down
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/Code.png',
                            width: 230,
                            height: 230,
                          ),
                          Text(
                            activitydate,
                            style: const TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            activitytime,
                            style: const TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            activityvenue,
                            style: const TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: 200,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                color: const Color(0xFF222222),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Center(
                child: Text(
                  'SAVE',
                  style: TextStyle(
                    color: Color(0xffff09c46),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
