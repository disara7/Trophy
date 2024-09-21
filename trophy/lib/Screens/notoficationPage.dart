import 'package:flutter/material.dart';
import 'package:trophy/myaccount/myaccount.dart';

import '../Components/main_appbar.dart';


class NotificationPage extends StatefulWidget {
  final VoidCallback openDrawer;
  const NotificationPage({super.key, required this.openDrawer});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: CustomAppBar(
          title: "HOME",
          leadingIcon: Icons.menu,
          onLeadingPressed: widget.openDrawer,
          actionIcon: Icons.account_circle,
          onActionPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyAccount(),
              ),
            );
          }
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
    );
  }
}
