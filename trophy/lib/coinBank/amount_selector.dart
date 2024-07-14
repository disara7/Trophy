import 'package:flutter/material.dart';

class AmountSelector extends StatefulWidget {
  final int initialAmount;
  final Function(int) onAmountChanged;
  final VoidCallback onRedeem;

  const AmountSelector({
    super.key,
    required this.initialAmount,
    required this.onAmountChanged,
    required this.onRedeem,
  });

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
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
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
              const SizedBox(width: 5),
              IconButton(
                icon: const Icon(Icons.arrow_drop_down, size: 40),
                onPressed: _decreaseAmount,
              ),
              const SizedBox(width: 5),
              Text(
                '$amount',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                  width:
                      10), // Add some spacing between the amount and the arrows
              IconButton(
                icon: const Icon(Icons.arrow_drop_up, size: 40),
                onPressed: _increaseAmount,
              ),
            ],
          ),
        ),
        const SizedBox(
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
          child: const Text(
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
