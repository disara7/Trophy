import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class MyArticles extends StatefulWidget {
  const MyArticles({super.key});

  @override
  _MyArticlesState createState() => _MyArticlesState();
}

class _MyArticlesState extends State<MyArticles> {
  final CarouselController _carouselController = CarouselController();
  List<Article> _articles = [];
  bool _isLoading = true;


  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');
    final response = await http.get(
      Uri.parse('http://172.20.10.2/api/getblog'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> articleJson = json.decode(response.body);
      setState(() {
        _articles = articleJson.map((json) => Article.fromJson(json)).toList();
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load articles');
    }
  }

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
            _isLoading
                ? const Center(child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('No Articles', style: TextStyle(color: Colors.black),),
                ))
                : CarouselSlider(
              items: _articles
                  .map((article) => buildArticleCard(article.title, article.subtitle, article.views))
                  .toList(),
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                viewportFraction: 1,
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
                  TextSpan(
                    text: '$title:',
                    style: const TextStyle(
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

class Article {
  final String title;
  final String subtitle;
  final int views;

  Article({
    required this.title,
    required this.subtitle,
    required this.views,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      subtitle: json['subtitle'],
      views: json['views'] != null ? json['views'] as int : 0,
    );
  }
}
