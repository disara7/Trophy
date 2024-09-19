import 'package:flutter/material.dart';
import 'package:trophy/Components/button.dart';
import 'package:trophy/Screens/my_blog.dart';

class SubmitComplete extends StatelessWidget {
  const SubmitComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display image from /Asset folder
            Image.asset(
              'assets/complete.png',
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text.rich(
                TextSpan(
                  text: 'Your article is being verified by the ',
                  style: TextStyle(fontSize: 20.0, color: Color(0xFF222222), fontWeight: FontWeight.w500,),
                  children: [
                    TextSpan(
                      text: 'administration',
                      style: TextStyle(
                        color: Color.fromARGB(255, 240, 156, 70),
                      ),
                    ),
                    TextSpan(text: '. This may take a while.'),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                child: customButton(
                    backgroundColor: const Color(0xFF222222),
                    textColor: const Color.fromARGB(255, 240, 156, 70),
                    text: 'Done',
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyBlogs(),
                        ),
                      );
                    }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
