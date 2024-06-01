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
                    'Participate in diverse workshops, fitness activities, clubs, societies, and volunteering projects alongside your workload.',
                  ),
                  _buildPage(
                    'assets/intro2.png',
                    'Collect Coins',
                    'Complete the interesting challenges given to collect bounties and climb the trophy ladder.',
                  ),
                  _buildPage(
                    'assets/intro3.png',
                    'Redeem Coins',
                    'Redeem your collected bounties at the canteen, parking, EV charging, and reservations at your convenience.',
                  ),
                  _buildPage(
                    'assets/intro4.png',
                    'Feeling Lucky?',
                    'Spin the wheel of fortune to harness your luck and gather bounties on your behalf.',
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
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
            SizedBox(height: 70),
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
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 117, 46, 5),
            ),
            textAlign: TextAlign.center, // Ensure the title is centered as well
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 30.0), // Increased padding
          child: Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center, // Center-align the paragraph
          ),
        ),
      ],
    );
  }
}
