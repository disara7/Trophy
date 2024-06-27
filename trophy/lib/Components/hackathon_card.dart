import 'package:flutter/material.dart';
import 'package:trophy/Screens/hackathondetailspage.dart';

class CustomHackCard extends StatelessWidget {
  final String hacktitle;
  final String hackdescription;
  final String hackimageUrl;
  final int hackcoinCount;
  final String hackathondetails;
  final String hackathonmainimgUrl;

  CustomHackCard({
    required this.hacktitle,
    required this.hackdescription,
    required this.hackimageUrl,
    required this.hackcoinCount,
    required this.hackathondetails,
    required this.hackathonmainimgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(248, 245, 225, 210),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                bottom: 20,
                left: 12,
                right: 12,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      hackimageUrl,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hacktitle,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFFFF09C46),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          hackdescription,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigate to Hackathon Details page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Hackathondetailspage(
                                      hacktitle: hacktitle,
                                      hackcoinCount: hackcoinCount,
                                      hackdescription: hackdescription,
                                      hackathondetails: hackathondetails,
                                      hackathonmainimgUrl: hackathonmainimgUrl,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 90,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF09C46),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text(
                                    'DETAILS',
                                    style: TextStyle(
                                      color: const Color(0xFF222222),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 90,
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xFF222222),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  'REGISTER',
                                  style: TextStyle(
                                    color: Color(0xFFFF09C46),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF222222),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFFFFFFFF),
                  width: 5,
                  strokeAlign: 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Coin.png',
                    width: 22,
                    height: 22,
                  ),
                  Text(
                    '$hackcoinCount',
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
