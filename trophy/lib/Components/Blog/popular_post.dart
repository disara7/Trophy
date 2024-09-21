import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:http/http.dart' as http;
import 'package:trophy/Screens/blog_preview.dart';
import 'package:trophy/constants.dart';

class PopularPostCard extends StatefulWidget {
  const PopularPostCard({super.key});

  @override
  _PopularPostCardState createState() => _PopularPostCardState();
}

class _PopularPostCardState extends State<PopularPostCard> {
  final CarouselController _carouselController = CarouselController();
  List<Map<String, dynamic>> _posts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/popularPosts'));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        setState(() {
          _posts = data.map((post) => {
            'title': post['title'] ?? 'No Title',
            'subtitle': post['subtitle'] ?? 'No Subtitle',
            'imageUrl': post['imageUrl'] ?? 'https://via.placeholder.com/150',
            'author': post['employeeName'] ?? 'Unknown Author',
            'content': post['content']
          }).toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      print('Error fetching posts: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Function to load content into QuillController
  QuillController loadContentToQuillController(String content) {
    List<dynamic> decodedContent = jsonDecode(content);
    Delta delta = Delta.fromJson(decodedContent);
    return QuillController(
      document: Document.fromDelta(delta),
      selection: const TextSelection.collapsed(offset: 0),
    );
  }


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
            _isLoading
                ? const Center(child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text('No Articles Found', style: TextStyle(color: Colors.white),),
                  ))
                : CarouselSlider(
              items: _posts.map((post) {
                return buildPostCard(
                  post['title'],
                  post['subtitle'],
                  post['imageUrl'],
                  post['author'],
                  post['content']
                );
              }).toList(),
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 300.0,
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

  Widget buildPostCard(String title, String subtitle, String imageUrl, String author, String content) {
    return GestureDetector(
      onTap: () {
        QuillController quillController = loadContentToQuillController(content);
        bool isNetworkImage = imageUrl.startsWith('http');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogPreviewPage(
              title: title,
              subtitle: subtitle,
              controller: quillController,
              image: isNetworkImage ? imageUrl : File(imageUrl),
            ),
          ),
        );
      },
      child: Container(
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
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrl.isNotEmpty ? imageUrl : 'https://via.placeholder.com/150',
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 240, 156, 70)),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF666666),
                ),
              ),
              const Spacer(),
              Text(
                '- $author',
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF222222),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
