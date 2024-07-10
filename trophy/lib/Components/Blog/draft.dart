import 'package:flutter/material.dart';

class Draft extends StatelessWidget {
  const Draft({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF222222),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Draft",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 240, 156, 70)),
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
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 248, 246, 246),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Article 1',
                          style: TextStyle(color: Color.fromARGB(255, 240, 156, 70), fontSize: 20),
                        ),
                        Icon(
                          Icons.edit_outlined,
                          color: Color(0xFF222222),
                          size: 24.0,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Color(0xFF222222)),
                        children: [
                          TextSpan(
                            text: 'Title:',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' Subtitle',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
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
