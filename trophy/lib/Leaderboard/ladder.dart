import 'package:flutter/material.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'package:trophy/navBar/navbar.dart';

class Ladder extends StatelessWidget {
  const Ladder({super.key});

  @override
  Widget build(BuildContext context) {
    // List of image paths
    final List<String> imagePaths = [
      'assets/Leaderboard/ladderbg1.png',
      'assets/Leaderboard/ladderbg2.png',
      'assets/Leaderboard/ladderbg3.png',
      'assets/Leaderboard/ladderbg4.png',
      'assets/Leaderboard/ladderbg5.png',
      'assets/Leaderboard/ladderbg6.png',
      'assets/Leaderboard/ladderbg7.png',
      'assets/Leaderboard/ladderbg8.png',
      'assets/Leaderboard/ladderbg9.png',
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'TROPHY LADDER',
        coinCount: 520,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, // Number of columns
              crossAxisSpacing: 5, // Space between columns (reduced)
              mainAxisSpacing: 5,  // Space between rows (reduced)
              childAspectRatio: 2,  // Adjust the height-to-width ratio of the grid items
            ),
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePaths[index]),
                    fit: BoxFit.contain, // Fit images to the container size
                  ),
                  borderRadius: BorderRadius.circular(8.0), // Optional rounded corners
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(onItemSelected: (index) {
        // Handle navigation item selection
      }),
    );
  }
}
