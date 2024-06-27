import 'package:flutter/material.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'package:trophy/Components/member_card.dart'; // Assuming this is the file where CustomCard is defined

class Community extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Community',
        coinCount: 500,
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: Color.fromARGB(0, 175, 171, 171)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  color: const Color(0xFF222222),
                  padding: EdgeInsets.all(15.0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'COIN COLLECTED',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Send the collected coins to',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200),
                                ),
                                Text(
                                  'other colleagues.',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      height: 0.5,
                                      fontWeight: FontWeight.w200),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 15),
                          Image.asset(
                            'assets/Coin.png', // Replace with your image URL
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '500',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Center the ListView and Wrap
            Expanded(
              child: Center(
                child: ListView(
                  children: [
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          CustomCard(
                            imageUrl:
                                'assets/member.png', // Replace with your image URL
                            title: 'Member 1',
                          ),
                          CustomCard(
                            imageUrl:
                                'assets/member.png', // Replace with your image URL
                            title: 'Member 2',
                          ),
                          CustomCard(
                            imageUrl:
                                'assets/member.png', // Replace with your image URL
                            title: 'Member 3',
                          ),
                          CustomCard(
                            imageUrl:
                                'assets/member.png', // Replace with your image URL
                            title: 'Member 4',
                          ),
                          CustomCard(
                            imageUrl:
                                'assets/member.png', // Replace with your image URL
                            title: 'Member 4',
                          ),
                          CustomCard(
                            imageUrl:
                                'assets/member.png', // Replace with your image URL
                            title: 'Member 4',
                          ),
                          CustomCard(
                            imageUrl:
                                'assets/member.png', // Replace with your image URL
                            title: 'Member 4',
                          ),
                          CustomCard(
                            imageUrl:
                                'assets/member.png', // Replace with your image URL
                            title: 'Member 4',
                          ),
                          // Add more CustomCard instances as needed
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
