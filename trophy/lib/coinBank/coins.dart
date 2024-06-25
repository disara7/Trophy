import 'package:flutter/material.dart';

class CoinsPage extends StatelessWidget {
  const CoinsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coins Page'),
      ),
      body: const Center(
        child: Text('This is the Coins Page'),
      ),
    );
  }
}
