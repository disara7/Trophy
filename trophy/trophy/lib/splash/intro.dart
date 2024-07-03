import 'package:flutter/material.dart';
// import 'package:your_app_name/login.dart'; // Uncomment and update with your actual import
// import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';
// import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:trophy/Screens/Authentication.dart';
import 'package:trophy/themes/color_palette.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  final _currentPageNotifier =
      ValueNotifier<int>(0); // Track current page for dots

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      _currentPageNotifier.value = _pageController.page!.round();
    });
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
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToLogin();
    }
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AuthPage()),
    );
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        --_currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15.0), // Increase padding
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Palette.appBrown, // Change icon color to brown
            ),
            onPressed: _goToPreviousPage,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove app bar elevation
      ),
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
            const SizedBox(
              height: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: PageViewIndicator(
            //     pageIndexNotifier: _currentPageNotifier,
            //     length: 4, // Number of pages in the PageView
            //     normalBuilder: (animationController, index) => Circle(
            //       size: 8.0,
            //       color: Palette.appGray,
            //     ),
            //     highlightedBuilder: (animationController, index) =>
            //         ScaleTransition(
            //       scale: CurvedAnimation(
            //         parent: animationController,
            //         curve: Curves.ease,
            //       ),
            //       child: Circle(
            //         size: 10.0,
            //         color: Palette.appBlack,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100, // Set the width of the button
                  child: ElevatedButton(
                    onPressed: _navigateToLogin,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      'SKIP',
                      style:  TextStyle(color: Palette.appBlack),
                    ),
                  ),
                ),
                const SizedBox(width: 40), // Decreased width here
                SizedBox(
                  width: 100, // Set the width of the button
                  child: ElevatedButton(
                    onPressed: _goToNextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.appBlack,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      'NEXT',
                      style: TextStyle(color: Palette.appOrange),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),
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
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Palette.appBrown,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Palette.appBlack,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
