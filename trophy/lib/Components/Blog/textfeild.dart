import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final int maxLength;

  const MyTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.maxLength = 255, // Default to no limit
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 240, 156, 70),
          ),
        ),
      ),
      maxLength: maxLength,
      maxLines: null,
    );
  }
}
