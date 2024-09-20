import 'package:flutter/material.dart';
import 'package:trophy/Components/Blog/discover.dart';
import 'package:trophy/Components/Blog/popular_post.dart';
import 'package:trophy/Components/button.dart';
import 'package:trophy/Components/custom_app_bar.dart';

import 'package:trophy/Screens/my_blog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trophy/Screens/write_blog.dart';
import 'package:trophy/navBar/navbar.dart';

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'BLOG',
        // coinCount: "520",
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'BLOG POST',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Color(0xFF222222)),
              ),
              const Text(
                  "Exhale by writing it away!",
                  style: TextStyle(fontSize: 16, color: Color(0xFF222222)),
              ),
              const SizedBox(height: 20.0),
              const PopularPostCard(),
              const SizedBox(height: 20.0),
              const DiscoverSection(),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  customButton(
                    backgroundColor: const Color(0xFF222222),
                    textColor: const Color.fromARGB(255, 240, 156, 70),
                    text: 'WRITE',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BlogWritingPage(draftJson: '',)),
                      );
                    },
                    icon: FontAwesomeIcons.penNib,
                  ),
                  const SizedBox(width: 10.0),
                  customButton(
                    backgroundColor: const Color(0xffE28C43),
                    textColor: const Color(0xff131212),
                    text: 'MY ARTICLES',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyBlogs()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(onItemSelected: (index) {
        // Handle navigation item selection
      }),
    );
  }
}
