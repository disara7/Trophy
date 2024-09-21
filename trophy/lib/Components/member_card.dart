import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  const CustomCard({
    super.key,
    String? imageUrl,
    required this.title,
    required this.onTap,
  }) : imageUrl = imageUrl ?? '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
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
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFF222222),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: imageUrl.isNotEmpty
                          ? Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                      )
                          : const Center(
                        child: Icon(
                          Icons.person,
                          size: 80,
                          color: Color.fromARGB(255, 240, 156, 70),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF222222),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: onTap, // Use the onTap callback
                    child: Container(
                      width: 130,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFF222222),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Text(
                          'Send Coins',
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
        ],
      ),
    );
  }
}
