import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PopularPostCard extends StatefulWidget {
  const PopularPostCard({super.key});

  @override
  _PopularPostCardState createState() => _PopularPostCardState();
}

class _PopularPostCardState extends State<PopularPostCard> {
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 240, 156, 70),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Popular post",
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
                buildPostCard('Title 1', 'Subtitle 1', 'Author 1'),
                buildPostCard('Title 2', 'Subtitle 2', 'Author 2'),
                buildPostCard('Title 3', 'Subtitle 3', 'Author 3'),
              ],
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 5),
                aspectRatio: 16 / 9,
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

  Widget buildPostCard(String title, String subtitle, String author) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
           const Spacer(),
            Text(
              '- $author',
              style: const TextStyle(
                  fontSize: 16.0, color: Color(0xFF222222)),
            ),
          ],
        ),
      ),
    );
  }
}
