import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Import your AmountSelector widget here

import 'package:trophy/coinBank/counter.dart';
import 'package:trophy/navBar/navbar.dart'; // Adjust the path as per your project structure

class RedeemPage extends StatefulWidget {
  const RedeemPage({super.key});

  @override
  _RedeemPageState createState() => _RedeemPageState();
}

class _RedeemPageState extends State<RedeemPage> {
  int amount = 0;

  void _onAmountChanged(int newAmount) {
    setState(() {
      amount = newAmount;
    });
  }

  void _onRedeem() {
    // Add your redeem action here
    print('Redeem $amount coins');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REDEEM COINS'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Your existing Stack with image and text
                Stack(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      child: Image.asset(
                        'assets/redeemcat.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(115, 20, 5, 0),
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'The effort pays off!\n',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'It’s about time you make use of the coins you’ve collected. Redeem the coins you have collected at the checkout of the following.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Your existing RedeemOptionsCarousel widget
                RedeemOptionsCarousel(),

                const SizedBox(height: 20),

                // Your existing Counter widget
                const Counter(count: 520),

                const SizedBox(height: 20),

                // Text widget for 'Select Amount to Redeem'
                const Text(
                  'Select Amount to Redeem',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                // Integrate AmountSelector widget here
                AmountSelector(
                  initialAmount: amount,
                  onAmountChanged: _onAmountChanged,
                  onRedeem: _onRedeem,
                ),

                const SizedBox(height: 20),

                // Your existing Container with text and image
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'First Orange Text',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Second Orange Text',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/cb1.png', // Replace with your image path
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(onItemSelected: (index) {
        // Handle navigation item selection
      }),
    );
  }
}

class RedeemOptionsCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
        'image': 'assets/canteen.png',
        'title': 'CANTEEN',
        'description': 'Enjoy a meal at the cafeteria.',
      },
      {
        'image': 'assets/parking.png',
        'title': 'PARKING',
        'description': 'Redeem for a parking spot.',
      },
      {
        'image': 'assets/play.png',
        'title': 'PLAY AREA',
        'description': 'Access to recreational facilities.',
      },
      {
        'image': 'assets/Sport.png',
        'title': 'SPORTS',
        'description': 'Redeem for sports activities.',
      },
      {
        'image': 'assets/charging.png',
        'title': 'EV CHARGING',
        'description': 'Access to charging facilities.',
      },
    ];

    return Container(
      height: 170.0,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 190.0,
          autoPlay: false,
          enlargeCenterPage: true,
        ),
        items: items.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage(item['image']!),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SizedBox(
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          item['description']!,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['title']!,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

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
              Row(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_drop_up, size: 40),
                        onPressed: _increaseAmount,
                      ),

                      const SizedBox(
                          height:
                              10), // Adjust the spacing between icons if needed
                    ],
                  ),
                ],
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
