import 'package:flutter/material.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'package:trophy/navBar/navbar.dart';
import 'package:trophy/themes/color_palette.dart'; // Make sure this is imported for consistent theme colors

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) { // Assuming there are 3 images
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // List of image paths for the carousel
    final List<String> carouselImagePaths = [
      'assets/Leaderboard/badge1.png',
      'assets/Leaderboard/badge2.png',
      'assets/Leaderboard/badge2.png',
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'LEADER BOARD',
        coinCount: 520,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView( // Scrollable content
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Three images in a column
                Column(
                  children: [
                    // First Image
                    Image.asset('assets/Leaderboard/rankbg.png', height: 220),
                    SizedBox(height: 10),

                    // Second Image with overlay of number, profile picture, name, coin, and coin count
                    Stack(
                      children: [
                        // Background image
                        Image.asset('assets/Leaderboard/rankbg3.png', height: 100),

                        // Overlaying Row on top of the image
                        Positioned(
                          top: 30, // Position the row a bit down from the top
                          left: 20, // Add some padding from the left
                          right: 20, // Add some padding from the right
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Rank Number
                              Text(
                                '4',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black, // White color for visibility
                                ),
                              ),
                              SizedBox(width: 1),

                              // Profile Picture Icon
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage('assets/profile_icon.png'), // Replace with actual profile picture
                              ),

                              // Name of the person
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 20),

                              // Coin Icon
                              Image.asset(
                                'assets/Coin.png', // Replace with the actual path to your coin image
                                width: 30,
                                height: 30,
                              ),

                              // Coin Count
                              Text(
                                '520',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // "YOUR RANK" aligned to the left
                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'YOUR RANK',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Palette.appBlack, // Use your defined color palette
                        ),
                      ),
                    ),

                    // Third Image with the same layout (copy-paste for consistency)
                    Stack(
                      children: [
                        // Background image
                        Image.asset('assets/Leaderboard/rankbg3.png', height: 100),

                        // Overlaying Row on top of the image
                        Positioned(
                          top: 30, // Position the row a bit down from the top
                          left: 20, // Add some padding from the left
                          right: 20, // Add some padding from the right
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Rank Number
                              Text(
                                '25',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black, // White color for visibility
                                ),
                              ),

                              // Profile Picture Icon
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage('assets/profile_icon.png'), // Replace with actual profile picture
                              ),

                              // Name of the person
                              Text(
                                'Jane Doe',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 20),


                              // Coin Icon
                              Image.asset(
                                'assets/Coin.png', // Replace with the actual path to your coin image
                                width: 30,
                                height: 30,
                              ),

                              // Coin Count
                              Text(
                                '450',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),



                // "YOUR BADGES" aligned to the left
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'YOUR BADGES',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Palette.appBlack, // Use your defined color palette
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 10),

                // Image carousel
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 110,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: carouselImagePaths.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Image.asset(
                              carouselImagePaths[index],
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      left: 5,
                      child: IconButton(
                        icon: Icon(Icons.arrow_left, color: Colors.black),
                        onPressed: _previousPage,
                      ),
                    ),
                    Positioned(
                      right: 5,
                      child: IconButton(
                        icon: Icon(Icons.arrow_right, color: Colors.black),
                        onPressed: _nextPage,
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(onItemSelected: (index) {
        // Handle navigation item selection
      }),
    );
  }
}
