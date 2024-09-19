import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:trophy/Components/Blog/blog_list.dart';
import 'package:trophy/Screens/blog_preview.dart';

class BlogCard extends StatelessWidget {
  final BlogPost blog;

  const BlogCard({Key? key, required this.blog}) : super(key: key);

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
    return InkWell(
      onTap: () {
        // Load the blog content into the QuillController
        QuillController quillController = loadContentToQuillController(blog.content);

        // Check if the image is a network image (starts with 'http')
        bool isNetworkImage = blog.imageUrl.startsWith('http');

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogPreviewPage(
              title: blog.title,
              subtitle: blog.subtitle,
              controller: quillController,
              image: isNetworkImage ? blog.imageUrl : File(blog.imageUrl),
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  blog.imageUrl.isNotEmpty ? blog.imageUrl : 'https://via.placeholder.com/150',
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16.0),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${blog.title}:',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 240, 156, 70),
                      ),
                    ),
                    TextSpan(
                      text: ' ${blog.subtitle}',
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Color(0xFF222222),
                      ),
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
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.remove_red_eye_rounded,
                        color: Color(0xFF222222),
                        size: 16.0,
                      ),
                      const SizedBox(width: 3.0),
                      Text(
                        '${blog.views}',
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
      ),
    );
  }
}
