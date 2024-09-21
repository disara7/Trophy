import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trophy/authcheck.dart';
import 'package:trophy/constants.dart';
import 'package:trophy/myaccount/myaccount.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final _prefs = SharedPreferences.getInstance();

  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    _fetchEmployeeData();
  }

  Future<void> _deleteToken(BuildContext context) async {
    final prefs = await _prefs;
    await prefs.remove('authToken');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Authentication token deleted'),
      ),
    );
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
    return Drawer(
      backgroundColor: const Color(0xFF222222),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              CircleAvatar(
                radius: 40.0,
                backgroundImage: imageUrl.startsWith('https') ? NetworkImage(imageUrl) : null,
                backgroundColor: const Color.fromARGB(255, 240, 156, 70),
                child: imageUrl.startsWith('https')
                    ? null
                    : const Icon(
                  Icons.person,
                  size: 40.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Navindu",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          const Divider(),
          // Drawer Menu Options
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _createDrawerItem(
                  icon: Icons.person,
                  text: 'My Account',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyAccount(),
                      ),
                    );
                  },
                ),
                _createDrawerItem(
                  icon: Icons.confirmation_number,
                  text: 'My Tickets',
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                _createDrawerItem(
                  icon: Icons.group,
                  text: 'My Clubs & Societies',
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                _createDrawerItem(
                  icon: Icons.help,
                  text: 'Help',
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                _createDrawerItem(
                  icon: Icons.lock,
                  text: 'Privacy',
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                _createDrawerItem(
                  icon: Icons.logout,
                  text: 'Logout',
                  onTap: () async {
                    await _deleteToken(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthCheck(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Drawer item creation function
  Widget _createDrawerItem({required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(
          color: Color.fromARGB(255, 240, 156, 70),
          fontWeight: FontWeight.w400,
        ),
      ),
      leading: Icon(
        icon,
        color: const Color.fromARGB(255, 240, 156, 70),
      ),
      onTap: onTap,
    );
  }
}
