import 'package:flutter/material.dart';
import 'package:trophy/Components/Blog/blog_list.dart';
import 'package:trophy/Components/button.dart';

class DiscoverSection extends StatelessWidget {
  final ApiService apiService;

  const DiscoverSection({Key? key, required this.apiService}) : super(key: key);

  void openPaginatedBlogList(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaginatedBlogList(
          fetchBlogs: apiService.fetchBlogs,
          category: category,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 243, 235, 235),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Discover",
              style: TextStyle(fontSize: 16, color: Color(0xFF222222)),
            ),
            Column(
              children: [
                Row(
                  children: [
                    discoverBtn(
                      optionText: 'NEWS',
                      countText: '28',
                      onPressed: () => openPaginatedBlogList(context, 'NEWS'),
                    ),
                    const SizedBox(width: 5.0),
                    discoverBtn(
                      optionText: 'Marketing',
                      countText: '18',
                      onPressed: () => openPaginatedBlogList(context, 'Marketing'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    discoverBtn(
                      optionText: 'Strategy',
                      countText: '7',
                      onPressed: () => openPaginatedBlogList(context, 'Strategy'),
                    ),
                    const SizedBox(width: 5.0),
                    discoverBtn(
                      optionText: 'Automation',
                      countText: '4',
                      onPressed: () => openPaginatedBlogList(context, 'Automation'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    discoverBtn(
                      optionText: 'Other',
                      countText: '14',
                      onPressed: () => openPaginatedBlogList(context, 'Other'),
                    ),
                    const SizedBox(width: 5.0),
                    discoverBtn(
                      optionText: 'All',
                      countText: '40',
                      onPressed: () => openPaginatedBlogList(context, 'All'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
