import 'dart:io';

import 'package:flutter/material.dart';
import 'ResetPassword.dart';
import 'package:trophy/themes/color_palette.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ResetPassword.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _obscurePassword = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _showForgotPasswordBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Palette.appBlack,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Reset Password',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: Palette.appWhite),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    labelStyle: const TextStyle(color: Palette.appWhite),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.appOrange),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    prefixIcon:
                        const Icon(Icons.email, color: Palette.appWhite),
                  ),
                  style: const TextStyle(color: Palette.appWhite),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.appOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Palette.appBlack),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _login() async {
    try {
      final response = await http.post(
        Uri.parse('http://13.60.28.40/auth/login'), // Replace with your actual server URL
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': _usernameController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Successful login
        var data = jsonDecode(response.body);
        print('Login successful: $data');

        // Handle successful login
        Navigator.push(
          context,
            MaterialPageRoute(
              builder: (context) => ResetPassword(username: _usernameController.text), // Pass username here
            ),
        );
      } else {
        // Handle failed login
        print('Failed to login (status code: ${response.statusCode})');
        _showErrorDialog(context, 'Login failed. Please check your credentials or try again later.');
      }
    } on SocketException catch (e) {
      // Handle network errors
      print('Network error: $e');
      _showErrorDialog(context, 'Connection error. Please check your network connection and try again.');
    } catch (e) {
      // Handle other exceptions
      print('Unexpected error: $e');
      _showErrorDialog(context, 'An error occurred during login. Please try again later.');
    }
  }
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: size.width,
                  height: size.height / 1.8,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset('assets/Login_img.png'),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: const TextStyle(color: Palette.appGray),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Palette.appOrange,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          prefixIcon: const Icon(Icons.person),
                        ),
                        style: const TextStyle(color: Palette.appBlack),
                        onChanged: (text) {
                          setState(() {
                            // Trigger a rebuild when the text changes
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Palette.appGray),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Palette.appOrange,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),
                        style: const TextStyle(color: Palette.appBlack),
                        onChanged: (text) {
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: _showForgotPasswordBottomSheet,
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(color: Palette.appBlack),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Palette.appOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Palette.appBlack),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
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
