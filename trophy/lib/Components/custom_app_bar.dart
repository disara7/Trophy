import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:trophy/constants.dart';
import 'package:trophy/myaccount/myaccount.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingPressed;
  final VoidCallback? onActionPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.leadingIcon,
    this.onLeadingPressed,
    this.onActionPressed,
  });

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  int coinCount = 100;
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    fetchCoinCount();
    _fetchEmployeeData();
  }

  Future<void> fetchCoinCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authToken');

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final response = await http.get(
      Uri.parse('$baseUrl/api/coin'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        coinCount = data['coinCount'];
      });
    } else {
      print(response);
      throw Exception('Failed to load coin count');
    }
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
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(widget.leadingIcon ?? Icons.arrow_back_ios, color: Colors.black),
          onPressed: widget.onLeadingPressed ?? widget.onBackPressed ?? () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Center(
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/Coin.png',
                  width: 40.0,
                  height: 40.0,
                ),
                const SizedBox(width: 4.0),
                Text(
                  '$coinCount',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: Color(0xFFF09C46),
                  ),
                ),
                const SizedBox(width: 4.0),
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
                    radius: 18,
                    backgroundColor: const Color(0xFF222222),
                    backgroundImage: imageUrl.startsWith('https')
                        ? NetworkImage(imageUrl)
                        : null,
                    child: imageUrl.startsWith('https')
                        ? null // No icon if there is a valid image
                        : const Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        flexibleSpace: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
