import 'package:flutter/material.dart';
import 'package:trophy/coinBank/amount_selector.dart';

class GiftPage extends StatelessWidget {
  const GiftPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SEND COINS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Stack(
          children: [
            // Your background image or decoration
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/sendbg.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Positioned text
            Positioned(
              top: 25,
              left: 20,
              right: 20,
              child: RichText(
                text: TextSpan(
                  text:
                      'Use coins as a form of gift to your colleagues to appreciate and support them.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            // Positioned AmountSelector
            Positioned(
              top: 150,
              left: 20,
              right: 20,
              child: AmountSelector(
                initialAmount: 0,
                onAmountChanged: _onAmountChanged,
                onRedeem: _onRedeem,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onAmountChanged(int newAmount) {
    // Implement your logic for amount change
  }

  void _onRedeem() {
    // Implement your redeem action
  }
}
