import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trophy/Screens/write_blog.dart';

class Draft extends StatefulWidget {
  const Draft({super.key});

  @override
  State<Draft> createState() => _DraftState();
}

class _DraftState extends State<Draft> {
  final CarouselController _carouselController = CarouselController();
  List<Map<String, dynamic>> drafts = [];

  @override
  void initState() {
    super.initState();
    _loadDrafts();
  }

  Future<void> _loadDrafts() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys().where((key) => key.startsWith('blogDraft'));
    final loadedDrafts = keys.map((key) {
      final draftJson = prefs.getString(key);
      return {
        'articleNo': 'Draft ${keys.toList().indexOf(key) + 1}',
        'title': jsonDecode(draftJson!)['title'],
        'subtitle': jsonDecode(draftJson)['subtitle'],
        'draftJson': draftJson,
      };
    }).toList();

    setState(() {
      drafts = loadedDrafts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF222222),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Draft",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 240, 156, 70)),
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
            drafts.isEmpty
                ? const Center(child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('No Drafts', style: TextStyle(color: Colors.white),),
                ))
                : CarouselSlider(
              items: drafts.map((draft) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlogWritingPage(
                          draftJson: draft['draftJson']!,
                        ),
                      ),
                    );
                  },
                  child: buildArticleCard(
                    draft['articleNo']!,
                    draft['title']!,
                    draft['subtitle']!,
                  ),
                );
              }).toList(),
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

  Widget buildArticleCard(String articleNo, String title, String subtitle) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 248, 246, 246),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  articleNo,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 240, 156, 70), fontSize: 20),
                ),
                const Icon(
                  Icons.edit_outlined,
                  color: Color(0xFF222222),
                  size: 24.0,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Color(0xFF222222)),
                children: [
                  TextSpan(
                    text: '$title:',
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' $subtitle',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
