import 'package:flutter/material.dart';

class GiftPage extends StatelessWidget {
  const GiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gift Page'),
      ),
      body: const Center(
        child: Text('This is the Gift Page'),
      ),
    );
  }
}
