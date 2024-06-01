import 'package:flutter/material.dart';
// import 'package:your_app_name/login.dart'; // Uncomment and update with your actual import

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < 3) {
      _pageController.animateToPage(
        ++_currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToLogin();
    }
  }

  void _navigateToLogin() {
    // Replace this with your navigation to the Login screen
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _buildPage(
                    'assets/intro1.png',
                    'Relax for a Change',
                    'Experience the ultimate relaxation and rejuvenation with our app. Unwind and take a break from the hustle and bustle.',
                  ),
                  _buildPage(
                    'assets/intro2.png',
                    'Learn More About Our App',
                    'Our app provides a variety of features to enhance your lifestyle and well-being. Dive in to discover more.',
                  ),
                  _buildPage(
                    'assets/intro3.png',
                    'Discover New Features',
                    'Stay updated with the latest features and improvements we have made to help you get the best experience.',
                  ),
                  _buildPage(
                    'assets/intro4.png',
                    'Get Started Now',
                    'Ready to take the next step? Get started now and explore all the benefits our app has to offer.',
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _navigateToLogin,
                  child: Text('Skip'),
                ),
                ElevatedButton(
                  onPressed: _goToNextPage,
                  child: Text('Next'),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(String imagePath, String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 200,
          height: 200,
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
