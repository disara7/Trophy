import 'package:flutter/material.dart';

class CoinsPage extends StatelessWidget {
  const CoinsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COINS'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/coinscat.png', // Use the local asset image
              height: 120, // Adjust the height as needed
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Collect coins as you engage in extra curricular activities, and climb the trophy ladder to become the coolest employee of the bunch!',
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
                height: 10), // Add some space between the image and the text
            Container(
              color: Colors.orange, // Set the background color to orange
              padding: const EdgeInsets.all(
                  16.0), // Add padding inside the container
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: const [
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
                    'Take your mind off the workload and engage in different tasks to earn coins. ',
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
    );
  }
}
