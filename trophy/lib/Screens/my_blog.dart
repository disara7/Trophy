import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trophy/Components/Blog/draft.dart';
import 'package:trophy/Components/Blog/my_articles.dart';
import 'package:trophy/Components/button.dart';
import 'package:trophy/Components/main_appbar.dart';
import 'package:trophy/Screens/write_blog.dart';

class MyBlogs extends StatefulWidget {
  const MyBlogs({super.key});

  @override
  State<MyBlogs> createState() => _MyBlogsState();
}

class _MyBlogsState extends State<MyBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "BLOG",
          leadingIcon: Icons.arrow_back_ios,
          onLeadingPressed: (){
            Navigator.pop(context);
            },
          actionIcon: Icons.account_circle,
          onActionPressed: (){}
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'MY ARTICLES',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Color(0xFF222222)),
            ),
            const SizedBox(height: 20.0),
            const MyArticles(),
            const SizedBox(height: 20.0),
            const Draft(),
            const SizedBox(height: 20.0),
            Row(
              children: [
                customButton(
                    backgroundColor: const Color(0xFF222222),
                    textColor: const Color.fromARGB(255, 240, 156, 70),
                    text: 'WRITE NEW ARTICLE',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BlogWritingPage()),
                      );
                    },
                    icon: FontAwesomeIcons.penNib
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
