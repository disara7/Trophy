import 'package:flutter/material.dart';
import 'package:trophy/Screens/blog.dart';
import 'package:trophy/Screens/home.dart';
import 'package:trophy/Screens/notoficationPage.dart';
import 'package:trophy/Screens/settings.dart';
import 'navbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Home(), // Home page
    const Blog(), // Blog page
    const NotificationPage(), // Notifications page
    Settings(), // Settings page
  ];

  void _onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(onItemSelected: _onItemSelected),
    );
  }
}