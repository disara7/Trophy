import 'package:flutter/material.dart';
import 'package:trophy/Components/Blog/blog_card.dart';
import 'package:trophy/Components/main_appbar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trophy/constants.dart';

class BlogPost {
  final String title;
  final String subtitle;
  final String imageUrl;
  final int views;
  final String content;

  BlogPost({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.views,
    required this.content
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      title: json['title'],
      subtitle: json['subtitle'],
      imageUrl: json['imageUrl'],
      views: json['views'],
      content: json['content']
    );
  }
}

class ApiService {
  Future<List<BlogPost>> fetchBlogs(int page, String category) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/fetchAcceptedBlogs?page=$page&category=$category'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      // Extract the list of blogs
      final List<dynamic> blogsJson = responseData['blogs'];

      return blogsJson.map((json) => BlogPost.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load blogs for category: $category');
    }
  }
}


class PaginatedBlogList extends StatefulWidget {
  final Future<List<BlogPost>> Function(int page, String category) fetchBlogs;
  final String category;

  const PaginatedBlogList({
    Key? key,
    required this.fetchBlogs,
    required this.category,
  }) : super(key: key);

  @override
  _PaginatedBlogListState createState() => _PaginatedBlogListState();
}

class _PaginatedBlogListState extends State<PaginatedBlogList> {
  final List<BlogPost> _blogs = [];
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  bool _initialLoading = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadMore();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  Future<void> _loadMore() async {
    if (_isLoading || !_hasMore) return;
    setState(() {
      _isLoading = true;
    });

    try {
      // Fetch blogs for the current page
      final newBlogs = await widget.fetchBlogs(_page, widget.category);

      setState(() {
        // If fewer blogs are returned than the page size, we know we've reached the last page
        if (newBlogs.isEmpty || newBlogs.length < 10) { // Assuming 10 is the page size
          _hasMore = false;
        } else {
          _hasMore = true;
        }

        _blogs.addAll(newBlogs);
        _page++; // Move to the next page for the next load
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading blogs: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
        _initialLoading = false; // Stops showing initial loader after first load
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 235, 235),
      appBar: CustomAppBar(
        title: "BLOG",
        leadingIcon: Icons.arrow_back_ios,
        onLeadingPressed: () {
          Navigator.pop(context);
        },
        actionIcon: Icons.account_circle,
        onActionPressed: () {},
      ),
      body: _initialLoading
          ? const Center(child: CircularProgressIndicator()) // Show loader for the initial data fetch
          : ListView.builder(
        controller: _scrollController,
        itemCount: _blogs.length + 1,
        itemBuilder: (context, index) {
          if (index < _blogs.length) {
            return BlogCard(blog: _blogs[index]);
          } else if (_hasMore) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('No more blogs to load'),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
