import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int coinCount;
  final VoidCallback onBackPressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.coinCount,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: onBackPressed,
        ),
        centerTitle: true,
        title: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.black),
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
                SizedBox(width: 4.0),
                Text(
                  '$coinCount',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: Color(0xFFF09C46),
                  ),
                ),
                SizedBox(width: 4.0),
                Icon(
                  Icons.account_circle,
                  size: 40.0,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
