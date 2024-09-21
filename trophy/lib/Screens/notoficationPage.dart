import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Components/custom_app_bar.dart';
import '../navBar/navbar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final _prefs = SharedPreferences.getInstance();
  Future<void> _deleteToken() async {
    final prefs = await _prefs;
    await prefs.remove('authToken');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Authentication token deleted'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: CustomAppBar(
          title: "NOTIFICATIONS",
          leadingIcon: Icons.menu,
          onLeadingPressed: (){},
          onActionPressed: _deleteToken
      ),

      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 26,right: 20,top: 20),
              child:  Image.asset('assets/notification_cat.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: height-355,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0XFFe9e8e9),
                ),
                child: Center(child: Text('No notifications')),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(onItemSelected: (index) {

      }),

    );
  }
}
