import 'package:flutter/material.dart';

class PopularPostCard extends StatelessWidget {
  const PopularPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 240, 156, 70),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Popular post",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF222222)),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.chevron_left, size: 30.0),
                  onPressed: () {}, // Replace with your action
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right, size: 30.0),
                  onPressed: () {}, // Replace with your action
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Title:',
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 240, 156, 70)),
                          ),
                          TextSpan(
                            text: ' Subtitle',
                            style: TextStyle(fontSize: 24.0, color: Color(0xFF222222)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      '-Author',
                      style: TextStyle(
                          fontSize: 16.0, color: Color(0xFF222222)),
                    )
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
