import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/catlap.png',
                    width: 300,
                  ),
                  const SizedBox(height: 40),
                  TextField(
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
                    child: SizedBox(
                      height: 50, 
                      child: ElevatedButton(
                        onPressed: () {
                       
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
