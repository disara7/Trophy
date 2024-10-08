import 'package:flutter/material.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'package:trophy/navBar/navbar.dart';
import 'earn_coins_section.dart'; // Import the new Dart file

class CoinsPage extends StatelessWidget {
  const CoinsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'COINS',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const CoinsPageContent(),
      bottomNavigationBar: BottomNavBar(onItemSelected: (index) {
        // Handle navigation item selection
      }),
    );
  }
}

class CoinsPageContent extends StatelessWidget {
  const CoinsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.all(16.0), // Add padding around the entire content
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/coinscat.png', // Use the local asset image
                height: 100, // Adjust the height as needed
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Collect coins as you engage in extracurricular activities, and climb the trophy ladder to become the coolest employee of the bunch!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12, // Adjust the font size here
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Use the new widget here
              const EarnCoinsSection(),

              const SizedBox(height: 10), // Add some space between sections

              Container(
                decoration: BoxDecoration(
                  color: Colors.orange, // Set the background color to orange
                  borderRadius:
                      BorderRadius.circular(12.0), // Set border radius here
                ),
                padding: const EdgeInsets.all(
                    16.0), // Add padding inside the container
                child: const Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align text to the left
                  children: [
                    Text(
                      'Redeeming Coins',
                      style: TextStyle(
                        color: Colors.black, // Set the text color to black
                        fontWeight: FontWeight.bold, // Make text bold
                        fontSize: 16, // Increase font size
                      ),
                    ),
                    SizedBox(height: 8), // Add space between texts
                    Text(
                      'Take your mind off the workload and engage in different tasks to earn coins.',
                      style: TextStyle(
                        color: Colors.black, // Set the text color to black
                      ),
                    ),
                    SizedBox(height: 20), // Add space between texts
                    Text(
                      'Gifting Coins',
                      style: TextStyle(
                        color: Colors.black, // Set the text color to black
                        fontWeight: FontWeight.bold, // Make text bold
                        fontSize: 16, // Increase font size
                      ),
                    ),
                    SizedBox(height: 8), // Add space between texts
                    Text(
                      'Use coins as a form of gift to your colleagues to appreciate and support them.',
                      style: TextStyle(
                        color: Colors.black, // Set the text color to black
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
