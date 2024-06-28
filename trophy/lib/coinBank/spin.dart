import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:math';
import 'dart:async';

import 'package:trophy/themes/color_palette.dart';

class SpinPage extends StatefulWidget {
  const SpinPage({Key? key}) : super(key: key);

  @override
  _SpinPageState createState() => _SpinPageState();
}

class _SpinPageState extends State<SpinPage> {
  final items = <String>[
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
  ];

  // Define different colors for each item segment
  final List<Color> segmentColors = [
    Colors.orange,
    Colors.green,
    Colors.lightBlue,
    Colors.purple,
    Colors.orange,
    Colors.white,
    Colors.green,
    Colors.pink,
  ];

  final StreamController<int> controller = StreamController<int>();

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  void _spinWheel() {
    final randomIndex = Random().nextInt(items.length);
    controller.add(randomIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spin Page'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  20.0, 60.0, 20.0, 20.0), // Adjust padding as needed
              child: Image.asset(
                'assets/spinbg.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/spincat.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 180.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                color: Colors.transparent,
                width: 200, // Set the desired width here
                child: const Text(
                  'FEELING LUCKY?',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0, // Decreased font size
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 180.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                color: Colors.transparent,
                width: 200, // Set the desired width here
                child: const Text(
                  'Let the lucky spinning wheel bring you more coins.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0, // Decreased font size
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 160.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 300,
                    child: FortuneWheel(
                      selected: controller.stream,
                      items: [
                        for (var i = 0; i < items.length; i++)
                          FortuneItem(
                            style: FortuneItemStyle(
                              color: segmentColors[
                                  i], // Assign color from segmentColors list
                              borderColor: Colors.transparent,
                              borderWidth: 1,
                            ),
                            child: Text(
                              items[i],
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 70),
                  ElevatedButton(
                    onPressed: _spinWheel,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Palette.appOrange,
                      backgroundColor: Palette.appBlack,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the radius as needed
                      ),
                    ),
                    child: const Text('SPIN THE WHEEL'),
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
