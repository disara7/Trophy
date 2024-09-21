import 'package:flutter/material.dart';
import 'package:trophy/Screens/community.dart';
import 'package:trophy/Screens/home.dart';
import 'package:trophy/Components/custom_drawer.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Home(openDrawer: _openDrawer),
          Community(openDrawer: _openDrawer),
          NotificationPage(openDrawer: _openDrawer),
          Settings(openDrawer: _openDrawer),
        ],
      ),
      drawer: CustomDrawer(),
      bottomNavigationBar: BottomNavBar(onItemSelected: _onItemSelected),
    );
  }
}