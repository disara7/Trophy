import 'package:flutter/material.dart';

Widget customIconButton(String text, String iconData, {double iconSize = 30.0, VoidCallback? onPressed}) {
  return Expanded(
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff131212),
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconData,
            width: iconSize
          ),
          const SizedBox(height: 5.0),
          Text(
            text,
            style: const TextStyle(color: Color(0xffF09C46)),
          ),
        ],
      ),
    ),
  );
}

