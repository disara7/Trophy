import 'package:flutter/material.dart';

class CoinsPage extends StatelessWidget {
  const CoinsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COINS'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Add padding around the entire content
        child: Center(
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
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      255, 198, 198, 198), // Set the background color to grey
                  borderRadius:
                      BorderRadius.circular(12.0), // Set border radius here
                ),
                padding: const EdgeInsets.all(
                    16.0), // Add padding inside the container
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align text to the left
                  children: [
                    Text(
                      'How to Earn Coins',
                      style: TextStyle(
                        color: Colors.black, // Set the text color to black
                        fontWeight: FontWeight.bold, // Make text bold
                        fontSize: 13, // Increase font size
                      ),
                    ),
                    SizedBox(height: 8), // Add space below the title

                    // Grid of cards
                    GridView.count(
                      crossAxisCount: 4, // 2 columns
                      crossAxisSpacing: 16.0, // Spacing between columns
                      mainAxisSpacing: 16.0, // Spacing between rows
                      shrinkWrap: true, // To wrap content inside the grid
                      physics:
                          NeverScrollableScrollPhysics(), // Disable grid scrolling
                      children: [
                        _buildCard('assets/image1.png', 'Activity 1'),
                        _buildCard('assets/image2.png', 'Activity 2'),
                        _buildCard('assets/image3.png', 'Activity 3'),
                        _buildCard('assets/image4.png', 'Activity 4'),
                        _buildCard('assets/image1.png', 'Activity 1'),
                        _buildCard('assets/image2.png', 'Activity 2'),
                        _buildCard('assets/image3.png', 'Activity 3'),
                        _buildCard('assets/image4.png', 'Activity 4'),
                        // Add more cards as needed
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                  height: 10), // Add some space between the image and the text
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange, // Set the background color to orange
                  borderRadius:
                      BorderRadius.circular(12.0), // Set border radius here
                ),
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
      ),
    );
  }
}

Widget _buildCard(String imagePath, String title) {
  return Card(
    elevation: 2, // Add elevation for a raised look
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0), // Rounded corners for card
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: 80, // Adjust image height as needed
        ),
        SizedBox(height: 8), // Space between image and text
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
