import 'package:flutter/material.dart';

class SpinPage extends StatelessWidget {
  const SpinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spin Page'),
      ),
      body: const Center(
        child: Text('This is the Spin Page'),
      ),
    );
  }
}
