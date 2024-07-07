import 'package:flutter/material.dart';
import 'package:trophy/Components/Blog/popular_post.dart';
import 'package:trophy/Components/button.dart';
import 'package:trophy/Components/main_appbar.dart';
import 'package:flutter/cupertino.dart';

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
            title: "BLOG",
            leadingIcon: Icons.menu,
            onLeadingPressed: (){},
            actionIcon: Icons.account_circle,
            onActionPressed: (){}
        ),
      body: Padding(
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
            const SizedBox(height: 10.0),
            const PopularPostCard(),
            const SizedBox(height: 10.0),
            Row(
              children: [
                customButton(
                  backgroundColor: const Color(0xFF222222),
                  textColor: const Color.fromARGB(255, 240, 156, 70),
                  text: 'Write',
                  onPressed: () {

                  },
                  icon: Icons.edit_outlined
                ),
                const SizedBox(width: 5.0),
                customButton(
                  backgroundColor: const Color(0xffE28C43),
                  textColor: const Color(0xff131212),
                  text: 'My Articles',
                  onPressed: () {

                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
