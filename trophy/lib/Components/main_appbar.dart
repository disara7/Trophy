import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback onLeadingPressed;
  final IconData?actionIcon;
  final VoidCallback?onActionPressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.leadingIcon,
    required this.onLeadingPressed,
    this.actionIcon,
    this.onActionPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 18.0),
        ),
      ),
      leading: IconButton(
        icon: Icon(leadingIcon, size: 30, color: Colors.black87),
        onPressed: onLeadingPressed,
      ),
      actions: [
        IconButton(
          icon: Icon(actionIcon, size: 32, color: Colors.black87),
          onPressed: onActionPressed,
        ),
      ], backgroundColor: const Color(0xffFDFEFF)
    );
  }
}
