// dialogs.dart
import 'package:flutter/material.dart';
import 'package:trophy/themes/button_styles.dart';

void showCongratulationsDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 300, // Set a maximum width
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'assets/intro3.png', // Adjust the path as per your asset location

                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16), // Adjust spacing as needed
              Text(
                message == 'Oops! Try again.' ? 'Oops!' : 'Congratulations!',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8), // Adjust spacing as needed
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('COLLECT'),
            style: ButtonStyles.elevatedButtonStyle,
          ),
        ],
      );
    },
  );
}
