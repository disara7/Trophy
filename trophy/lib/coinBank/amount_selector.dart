import 'package:flutter/material.dart';
import '../themes/color_palette.dart';

class AmountSelector extends StatefulWidget {
  final int initialAmount;
  final Function(int) onAmountChanged;
  final VoidCallback onRedeem;

  const AmountSelector({
    Key? key,
    required this.initialAmount,
    required this.onAmountChanged,
    required this.onRedeem,
  }) : super(key: key);

  @override
  _AmountSelectorState createState() => _AmountSelectorState();
}

class _AmountSelectorState extends State<AmountSelector> {
  late int amount;

  @override
  void initState() {
    super.initState();
    amount = widget.initialAmount;
  }

  void _increaseAmount() {
    setState(() {
      amount++;
      widget.onAmountChanged(amount);
    });
  }

  void _decreaseAmount() {
    setState(() {
      if (amount > 0) {
        amount--;
        widget.onAmountChanged(amount);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/Coin.png',
                width: 30, // Adjust the size of the coin image as needed
                height: 30,
              ),
              SizedBox(width: 10),
              Text(
                '$amount',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                  width:
                      10), // Add some spacing between the amount and the arrows
              Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: IconButton(
                      icon: Icon(Icons.arrow_drop_up, size: 40),
                      onPressed: _increaseAmount,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 40, // Adjust top position to overlap
                    child: IconButton(
                      icon: Icon(Icons.arrow_drop_down, size: 40),
                      onPressed: _decreaseAmount,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
            width:
                10), // Add some spacing between the amount selector and the button
        ElevatedButton(
          onPressed: widget.onRedeem,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.orange, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  8), // Adjust the corner radius as needed
            ),
          ),
          child: Text(
            'REDEEM',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
