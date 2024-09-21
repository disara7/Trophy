import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trophy/authcheck.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final _prefs = SharedPreferences.getInstance();

  Future<void> _deleteToken(BuildContext context) async {
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
    return Drawer(
      backgroundColor: const Color(0xFF222222),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80),
              CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/profile_pic.png'),
                backgroundColor: Color.fromARGB(255, 240, 156, 70),
                child: Icon(
                  Icons.person,
                  size: 40.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Navindu",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
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
                    Navigator.of(context).pop();
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
                  icon: Icons.notifications,
                  text: 'Notifications',
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
                  icon: Icons.settings,
                  text: 'Settings',
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
