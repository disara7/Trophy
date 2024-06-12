import 'package:flutter/material.dart';
import 'package:trophy/themes/color_palette.dart';

class Activities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Palette.appWhite,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Palette.appBlack),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            centerTitle: true,
            title: const Text(
              'ACTIVITIES',
              style: TextStyle(fontSize: 20, color: Palette.appBlack),
            ),
            actions: <Widget>[
              // Margin to the right of the AppBar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Gray background color
                  borderRadius: BorderRadius.circular(100.0), // Rounded corners
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/Coin.png', // Path to the coin image
                      width: 40.0, // Width of the coin image
                      height: 40.0, // Height of the coin image
                    ),
                    SizedBox(width: 4.0), // Space between the coin and the text
                    const Text(
                      '500', // Number of coins
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,

                        color: Palette.appOrange, // Text color
                      ),
                    ),
                    SizedBox(
                        width:
                            4.0), // Space between the text and the profile icon
                    Icon(
                      Icons.account_circle,
                      size: 40.0, // Size of the icon
                      color: Palette.appBlack, // Icon color
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Text(
                  'Engage in the following extracurricular activities to earn coins and climb the Trophy ladder like a champ!',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          )),
    );
  }
}
