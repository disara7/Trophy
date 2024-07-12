import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyArticles extends StatefulWidget {
  const MyArticles({super.key});

  @override
  _MyArticlesState createState() => _MyArticlesState();
}

class _MyArticlesState extends State<MyArticles> {
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 235, 235),
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        border: Border.all(
          color: const Color(0x22222222),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "My Articles",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF222222)),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.chevron_left, size: 30.0),
                  onPressed: () {
                    _carouselController.previousPage();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right, size: 30.0),
                  onPressed: () {
                    _carouselController.nextPage();
                  },
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            CarouselSlider(
              items: [
                buildArticleCard('Title 1', 'Subtitle 1', 20),
                buildArticleCard('Title 2', 'Subtitle 2', 30),
                buildArticleCard('Title 3', 'Subtitle 3', 40),
              ],
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: false,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                initialPage: 0,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildArticleCard(String title, String subtitle, int views) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        border: Border.all(
          color: const Color(0xFF222222),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Title:',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 240, 156, 70)),
                  ),
                  TextSpan(
                    text: ' $subtitle',
                    style: const TextStyle(
                        fontSize: 24.0, color: Color(0xFF222222)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            IntrinsicWidth(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0x22222222),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 5.0, horizontal: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.remove_red_eye_rounded,
                      color: Color(0xFF222222),
                      size: 16.0,
                    ),
                    const SizedBox(width: 3.0),
                    Text(
                      '$views',
                      style: const TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
