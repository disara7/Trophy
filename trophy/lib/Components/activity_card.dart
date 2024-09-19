import 'dart:core';

import 'package:flutter/material.dart';
import 'package:trophy/Screens/activitiesdetailspage.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final int coinCount;
  final String activitiesdetails;
  final String activitiesmainimgUrl;
  final String activitytime;
  final String activityvenue;
  final String activitydate;

  const CustomCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.coinCount,
    required this.activitiesdetails,
    required this.activitiesmainimgUrl,
    required this.activitydate,
    required this.activitytime,
    required this.activityvenue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 160,
            decoration: BoxDecoration(
              color: const Color.fromARGB(248, 245, 225, 210),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 20, left: 12, right: 12),
              child: Column(
                children: [
                  Image.asset(
                    imageUrl,
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xffff09c46),
                    ),
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(height: 1.1, fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Activitiesdetailspage(
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
                      width: 120,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFF222222),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Text(
                          'GOING',
                          style: TextStyle(
                            color: Color(0xffff09c46),
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
                  color: const Color(0xFFFFFFFF),
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
                    '$coinCount',
                    style: const TextStyle(
                      color: Color(0xffff09c46),
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
