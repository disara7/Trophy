import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:trophy/coinBank/dialogs.dart';
import 'package:trophy/navBar/navbar.dart';
import 'package:trophy/themes/button_styles.dart';
import 'dart:math';
import 'dart:async';
import 'package:trophy/themes/color_palette.dart';
import 'package:trophy/Components/custom_app_bar.dart';

class SpinPage extends StatefulWidget {
  const SpinPage({super.key});

  @override
  _SpinPageState createState() => _SpinPageState();
}

class _SpinPageState extends State<SpinPage> {
  final items = <String>[
    'Item 1',
    'Item 2',
    'SPIN x1',
    '2x ',
    'TRY AGAIN',
    'Item 6',
    'SPIN x1',
    'TRY AGAIN',
  ];

  final List<Color> segmentColors = [
    Colors.orange,
    Colors.green,
    Colors.lightBlue,
    Palette.appPurple,
    Colors.orange,
    Colors.white,
    Colors.green,
    Colors.pink,
  ];

  final StreamController<int> controller = StreamController<int>();

  bool spinning = false;

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  void _spinWheel() {
    if (spinning) return; // Prevent multiple spins while spinning

    setState(() {
      spinning = true;
    });

    final randomIndex = Random().nextInt(items.length);
    Timer(const Duration(seconds: 3), () {
      controller.add(randomIndex);
      setState(() {
        spinning = false;
        Future.delayed(const Duration(milliseconds: 5500), () {
          _showCongratulations(randomIndex);
        });
      });
    });
  }

  void _showCongratulations(int index) {
    String message;
    if (items[index] == 'TRY AGAIN') {
      message = 'Oops! Try again.';
    } else {
      message = 'Congratulations! You won ${items[index]} coins.';
    }

    showCongratulationsDialog(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'SPIN',
        coinCount: 520,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: Stack(
          children: [
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
                      height: 350,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Background image
                          Image.asset(
                            'assets/spinbg.png',
                            fit: BoxFit.contain,
                            height: 350,
                            width: double.infinity,
                          ),
                          // Fortune wheel
                          Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: FortuneWheel(
                              selected: controller.stream,
                              items: [
                                for (var i = 0; i < items.length; i++)
                                  FortuneItem(
                                    style: FortuneItemStyle(
                                      color: segmentColors[i],
                                      borderColor: Colors.transparent,
                                      borderWidth: 1,
                                    ),
                                    child: i == 0
                                        ? Transform.rotate(
                                            angle: pi / 2,
                                            child: Image.asset(
                                              'assets/giftbox.png',
                                              width: 40,
                                              height: 40,
                                            ),
                                          )
                                        : i == 1
                                            ? Image.asset(
                                                'assets/Coin.png',
                                                width: 40,
                                                height: 40,
                                              )
                                            : i == 3
                                                ? Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const Text(
                                                        '2x ',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Image.asset(
                                                        'assets/Coin.png',
                                                        width: 40,
                                                        height: 40,
                                                      ),
                                                    ],
                                                  )
                                                : i == 5
                                                    ? Image.asset(
                                                        'assets/coinset.png',
                                                        width: 40,
                                                        height: 40,
                                                      )
                                                    : Text(
                                                        items[i],
                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _spinWheel,
                      style: ButtonStyles.elevatedButtonStyle,
                      child: const Text('SPIN THE WHEEL'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(onItemSelected: (index) {
        // Handle navigation item selection
      }),
    );
  }
}
