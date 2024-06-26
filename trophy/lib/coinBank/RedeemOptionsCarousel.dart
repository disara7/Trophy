import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RedeemOptionsCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0, // Adjusted height of the Container
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 120.0, // Adjusted height of the CarouselSlider
          autoPlay: false,
          enlargeCenterPage: true,
        ),
        items: [
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
            'title': 'Play Area',
            'description': 'Access to recreational facilities.',
          },
          {
            'image': 'assets/sport.png',
            'title': 'Sports Facility',
            'description': 'Redeem for sports activities.',
          },
          {
            'image': 'assets/charging.png',
            'title': 'Charging Station',
            'description': 'Access to charging facilities.',
          },
        ].map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width:
                    MediaQuery.of(context).size.width * 0.8, // Adjusted width
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage(item['image']!),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['description']!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          item['title']!,
                          style: TextStyle(
                            fontSize: 16,
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
