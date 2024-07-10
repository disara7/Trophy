import 'package:flutter/material.dart';

class MyArticles extends StatelessWidget {
  const MyArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 235, 235),
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        border: Border.all(
          color: const Color(0x22222222),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "My Articles",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF222222)),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.chevron_left, size: 30.0),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right, size: 30.0),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(
                  color: const Color(0xFF222222),
                  width: 1.0,
                ),
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
                    IntrinsicWidth(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0x22222222),
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.remove_red_eye_rounded,
                              color: Color(0xFF222222),
                              size: 16.0,
                            ),
                            SizedBox(width: 3.0),
                            Text(
                              '20',
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
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
