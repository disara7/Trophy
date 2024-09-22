import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trophy/constants.dart';
import 'package:trophy/navBar/mainscreen.dart';

class ResetPassword extends StatefulWidget {
  final String username;

  const ResetPassword({super.key, required this.username});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _errorMessage;

  Future<void> _verifyPasswords() async {
    setState(() {
      _errorMessage = null; // Clear any previous error message
      if (_newPasswordController.text.isEmpty || _confirmPasswordController.text.isEmpty) {
        _errorMessage = "Please enter both passwords.";
      } else if (_newPasswordController.text != _confirmPasswordController.text) {
        _errorMessage = "Passwords do not match.";
      }
    });

    if (_errorMessage == null) {
      // Pass username and new password to backend
      final String newPassword = _newPasswordController.text;
      final response = await http.post(
        Uri.parse('$baseUrl/auth/change-password'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': widget.username, // Use username from StatefulWidget
          'newPassword': newPassword,
        }),
      );

      if (response.statusCode == 200) {
        // Handle successful password reset
        print('Password reset successful');
        var data = jsonDecode(response.body);

        // Store the token in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('authToken', data['token']);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Successful'),
              content: const Text('Your password has been reset successfully.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigate to MainScreen after dialog dismissal
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainScreen()),
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Handle failed password reset
        print('Failed to reset password (status code: ${response.statusCode})');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/catlap.png',
                  width: 300,
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _newPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFF09C46)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFF09C46)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _verifyPasswords();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF09C46),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
