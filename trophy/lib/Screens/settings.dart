import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trophy/myaccount/myaccount.dart';
import '../Components/main_appbar.dart';

class Settings extends StatefulWidget {
  final VoidCallback openDrawer;
  const Settings({super.key, required this.openDrawer});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkMode = false;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: SettingsSection(
              title: 'Account',
              tiles: [
                SettingsTile(
                  icon: Icons.person,
                  title: 'Edit Profile',
                  onTap: () {},
                ),
                SettingsTile(
                  icon: Icons.lock,
                  title: 'Change Password',
                  onTap: () {},
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 10),
            child: SettingsSection(
              title: 'Preferences',
              tiles: [
                SwitchListTile(
                  title: Text('Dark Mode'),
                  secondary: Icon(Icons.dark_mode,color: Color(0XFFF09C46),),
                  value: isDarkMode,
                  onChanged: (bool value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Enable Notifications'),
                  secondary: Icon(Icons.notifications_active,color: Color(0XFFF09C46),),
                  value: notificationsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 10),
            child: SettingsSection(
              title: 'Privacy & Security',
              tiles: [
                SettingsTile(
                  icon: Icons.security,
                  title: 'Privacy Settings',
                  onTap: () {},
                ),
                SettingsTile(
                  icon: Icons.delete,
                  title: 'Delete Account',
                  onTap: () {},
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFFF09C46),
                ),
                onPressed: () {},
                child: Text('Logout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> tiles;

  const SettingsSection({
    Key? key,
    required this.title,
    required this.tiles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0XFFF09C46),
          ),
        ),
        SizedBox(height: 8),
        Column(children: tiles),
      ],
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingsTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Color(0XFFF09C46),),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
