import 'package:flutter/material.dart';
import 'package:trophy/Components/activity_button.dart';
import 'package:trophy/Components/button.dart';
import 'package:trophy/navBar/navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'HOME',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 30,
          color: Colors.black87,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            iconSize: 32,
            color: Colors.black87,
            onPressed: () {},
          ),
        ],
        backgroundColor: const Color(0xffFDFEFF),
      ),

      body: Column(
        children: [
          // Coins collected section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Home/coincard.png'),
                  fit: BoxFit.contain,
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Image.asset('assets/Home/home1.png'),
                  ),
                  const Spacer(),
                   Column(
                    children: [
                      const Text(
                        'COINS COLLECTED',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE6D9D9)
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset('assets/Home/Coin.png', height: 30.0),
                          const SizedBox(width: 5.0),
                          const Text(
                            '500',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFE6D9D9)
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),


          // Daily challenge section
          Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Container(
              padding: const EdgeInsets.only(left: 60.0, right: 20.0, bottom: 30.0, top: 30.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Home/home2.png'),
                  fit: BoxFit.contain,
                ),
              ),
              child: const Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Daily challenge',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF222222)
                        ),
                      ),
                      Text(
                        '125/500',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 151, 52, 51)
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        'Level',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF222222)
                        ),
                      ),
                      Text(
                        '02',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 151, 52, 51)
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          // Earn Coin section
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 230, 230, 230),
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              child: Column(
                children: [
                  const Text(
                    'Take part in following to earn more coins!',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xff131212)),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customIconButton(
                        'Carpool',
                        'assets/activity1.png',
                        onPressed: () {

                        },
                      ),
                      const SizedBox(width: 5.0),
                      customIconButton(
                        'Activities',
                        'assets/activity2.png',
                        onPressed: () {

                        },
                      ),
                      const SizedBox(width: 5.0),
                      customIconButton(
                        'Hackathons',
                        'assets/activity3.png',
                        onPressed: () {

                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customIconButton(
                        'Blog',
                        'assets/activity4.png',
                        iconSize: 27.0,
                        onPressed: () {

                        },
                      ),
                      const SizedBox(width: 5.0),
                      customIconButton(
                        'Sports',
                        'assets/activity5.png',
                        onPressed: () {

                        },
                      ),
                      const SizedBox(width: 5.0),
                      customIconButton(
                        'Therapy',
                        'assets/activity6.png',
                        onPressed: () {

                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),


          // Coin bank and Trophy ladder Buttons
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0, top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customButton(
                  const Color(0xffE28C43),
                  const Color(0xff131212),
                  'COIN BANK',
                      () {

                  },
                ),
                const SizedBox(width: 20.0),
                trophyButton(
                  const Color(0xff131212),
                  const Color(0xffE28C43),
                  'TROPHY LADDER',
                      () {

                  },
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xffFDFEFF),
    );
  }
}
