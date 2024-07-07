import 'package:flutter/material.dart';
import 'package:trophy/Screens/home.dart';
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
    Container(), // Message page
    Container(), // Notifications page
    Container(), // Settings page
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