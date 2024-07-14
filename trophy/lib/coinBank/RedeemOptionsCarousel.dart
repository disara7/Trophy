import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RedeemOptionsCarousel extends StatelessWidget {
  const RedeemOptionsCarousel({super.key});

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
