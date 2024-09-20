import 'package:flutter/material.dart';
import 'package:trophy/myaccount/myaccount.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int coinCount;
  final VoidCallback? onBackPressed;
  final IconData? leadingIcon; // Leading icon parameter
  final VoidCallback? onLeadingPressed; // Leading icon press handler
  final VoidCallback? onActionPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.coinCount = 520,
    this.onBackPressed,
    this.leadingIcon, // Add leadingIcon
    this.onLeadingPressed, // Add onLeadingPressed
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: AppBar(
        backgroundColor: Colors.white,
        // Use leadingIcon and onLeadingPressed if provided, otherwise use back arrow
        leading: IconButton(
          icon: Icon(leadingIcon ?? Icons.arrow_back_ios, color: Colors.black),
          onPressed: onLeadingPressed ?? onBackPressed ?? () {
            Navigator.pop(context); // Default back behavior if not provided
          },
        ),
        centerTitle: true,
        title: Center(
          child: Text(
            title,
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
                  child: const Icon(
                    Icons.account_circle,
                    size: 40.0,
                    color: Colors.black,
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
