import 'package:flutter/material.dart';
import 'package:trophy/navBar/navbar.dart';

class CoinBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CoinBank'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2, // Two cards per row
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: [
            CoinCard(
              imagePath: 'assets/intro1.png',
              title: 'Coin 1',
              onPressed: () {
                print('Coin 1 button pressed');
              },
            ),
            CoinCard(
              imagePath: 'assets/coin2.png',
              title: 'Coin 2',
              onPressed: () {
                print('Coin 2 button pressed');
              },
            ),
            CoinCard(
              imagePath: 'assets/coin3.png',
              title: 'Coin 3',
              onPressed: () {
                print('Coin 3 button pressed');
              },
            ),
            CoinCard(
              imagePath: 'assets/coin4.png',
              title: 'Coin 4',
              onPressed: () {
                print('Coin 4 button pressed');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class CoinCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onPressed;

  CoinCard(
      {required this.imagePath, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: onPressed,
              child: Text('Press me'),
            ),
          ],
        ),
      ),
    );
  }
}
