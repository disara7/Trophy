import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trophy/constants.dart';
import 'package:trophy/myaccount/myaccount.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback onLeadingPressed;
  final IconData? actionIcon;
  final VoidCallback? onActionPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.onLeadingPressed,
    this.actionIcon,
    this.onActionPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    _fetchEmployeeData();
  }

  Future<void> _fetchEmployeeData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('authToken');

      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final response = await http.get(
        Uri.parse('$baseUrl/api/fetchMyData'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          imageUrl = data['profileUrl'] ?? '';
        });
      } else {
        throw Exception('Failed to load employee data');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching data: $e'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          widget.title,
          style: const TextStyle(fontSize: 18.0),
        ),
      ),
      leading: IconButton(
        icon: Icon(widget.leadingIcon, size: 30, color: Colors.black87),
        onPressed: widget.onLeadingPressed,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyAccount(),
              ),
            );
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFF222222),
            backgroundImage: imageUrl.startsWith('https')
                ? NetworkImage(imageUrl)
                : null,
            child: imageUrl.startsWith('https')
                ? null
                : const Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 20)
      ],
      backgroundColor: const Color(0xffFDFEFF),
    );
  }
}

class BlogAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback onLeadingPressed;
  final IconData?actionIcon;
  final VoidCallback?onActionPressed;

  const BlogAppBar({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.onLeadingPressed,
    this.actionIcon,
    this.onActionPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
        leading: IconButton(
          icon: Icon(leadingIcon, size: 30, color: Colors.black87),
          onPressed: onLeadingPressed,
        ),
        actions: [
          IconButton(
            icon: Icon(actionIcon, size: 32, color: Colors.black87),
            onPressed: onActionPressed,
          ),
        ], backgroundColor: const Color(0xffFDFEFF)
    );
  }
}