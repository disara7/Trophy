import 'package:flutter/material.dart';

class EarnCoinsSection extends StatelessWidget {
  const EarnCoinsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(
            255, 230, 230, 230), // Set the background color to grey
        borderRadius: BorderRadius.circular(10.0), // Set border radius here
      ),
      padding: const EdgeInsets.all(18.0), // Add padding inside the container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          const Text(
            'How to Earn Coins',
            style: TextStyle(
              color: Colors.black, // Set the text color to black
              fontWeight: FontWeight.bold, // Make text bold
              fontSize: 13, // Increase font size
            ),
          ),
          const SizedBox(height: 8), // Add space below the title

          // Grid of cards
          GridView.count(
            crossAxisCount: 3, // 3 columns
            crossAxisSpacing: 8.0, // Spacing between columns
            mainAxisSpacing: 8.0, // Spacing between rows
            shrinkWrap: true, // To wrap content inside the grid
            physics:
                const NeverScrollableScrollPhysics(), // Disable grid scrolling
            children: [
              _buildCard('assets/activity1.png', 'Carpool'),
              _buildCard('assets/activity2.png', 'Activities'),
              _buildCard('assets/activity3.png', 'Hackathons'),
              _buildCard('assets/activity4.png', 'Blog'),
              _buildCard('assets/activity5.png', 'Sports'),
              _buildCard('assets/activity6.png', 'Therapy'),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildCard(String imagePath, String title) {
  return Card(
    elevation: 2, // Add elevation for a raised look
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0), // Rounded corners for card
    ),
    color: Colors.black, // Set the background color of the card to black
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: 30, // Adjust image height as needed
        ),
        const SizedBox(height: 10), // Space between image and text
        Text(
          title,
          style: const TextStyle(
            color: Colors.orange, // Set the text color to orange
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}
