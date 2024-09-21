import 'package:flutter/material.dart';
import 'package:trophy/Components/button.dart';
import 'package:trophy/Screens/activities.dart';
import 'package:trophy/navBar/mainscreen.dart';

class SuccessfulPage extends StatelessWidget {
  final int coinAmount;

  const SuccessfulPage({super.key, required this.coinAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/complete.png',
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text.rich(
                TextSpan(
                  text: 'Congratulations',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF222222),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'You have collected $coinAmount coins!',
              style: const TextStyle(
                fontSize: 18.0,
                color: Color(0xFF222222),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                child: customButton(
                  backgroundColor: const Color(0xFF222222),
                  textColor: const Color.fromARGB(255, 240, 156, 70),
                  text: 'Done',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Activities(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FailedPage extends StatelessWidget {
  const FailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/complete.png',
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Failed to Scan',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFF222222),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please try again later.',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xFF222222),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                child: customButton(
                  backgroundColor: const Color(0xFF222222),
                  textColor: const Color.fromARGB(255, 240, 156, 70),
                  text: 'OK',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Activities(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
