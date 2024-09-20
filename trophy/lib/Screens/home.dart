import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trophy/Components/activity_button.dart';
import 'package:trophy/Components/button.dart';
import 'package:trophy/Leaderboard/ladder.dart';
import 'package:trophy/Screens/Therapy/therapy_home.dart';
import 'package:trophy/Screens/activities.dart';
import 'package:trophy/Screens/blog.dart';
import 'package:trophy/Screens/hackathon.dart';
import 'package:trophy/Screens/sports.dart';
import 'package:trophy/blocs/home/bloc.dart';
import 'package:trophy/blocs/home/event.dart';
import 'package:trophy/blocs/home/state.dart';

import 'package:trophy/Components/main_appbar.dart';
import 'package:trophy/coinBank/coinbank.dart';
import 'package:trophy/navBar/navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _prefs = SharedPreferences.getInstance();
  Future<void> _deleteToken() async {
    final prefs = await _prefs;
    await prefs.remove('authToken');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Authentication token deleted'),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc()..add(LoadHomeData()),
        ),
      ],
      child: Scaffold(
        appBar:  CustomAppBar(
            title: "HOME",
            leadingIcon: Icons.menu,
            onLeadingPressed: (){},
            actionIcon: Icons.account_circle,
            onActionPressed: _deleteToken
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
            return SingleChildScrollView(
              clipBehavior: Clip.none,
              child: Column(
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
                                  Text(
                                    '${state.coins}',
                                    style: const TextStyle(
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
                      child: Row(
                        children: [
                          Column(
                            children: [
                              const Text(
                                'Daily challenge',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF222222)
                                ),
                              ),
                              Text(
                                '${state.completedChallenges}/${state.dailyChallenge}',
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 151, 52, 51)
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              const Text(
                                'Level',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF222222)
                                ),
                              ),
                              Text(
                                '${state.level}',
                                style: const TextStyle(
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Activities(), // Navigate to CoinBankPage
                                    ),
                                  );

                                },
                              ),
                              const SizedBox(width: 5.0),
                              customIconButton(
                                'Hackathons',
                                'assets/activity3.png',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Hackathon(), // Navigate to CoinBankPage
                                    ),
                                  );

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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Blog(), // Navigate to CoinBankPage
                                    ),
                                  );

                                },
                              ),
                              const SizedBox(width: 5.0),
                              customIconButton(
                                'Sports',
                                'assets/activity5.png',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Sports(), // Navigate to CoinBankPage
                                    ),
                                  );

                                },
                              ),
                              const SizedBox(width: 5.0),
                              customIconButton(
                                'Therapy',
                                'assets/activity6.png',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CategoryPage(), // Navigate to CoinBankPage
                                    ),
                                  );

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
                          backgroundColor: const Color(0xffE28C43),
                          textColor: const Color(0xff131212),
                          text: 'COIN BANK',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CoinBank(), // Navigate to CoinBankPage
                              ),
                            );

                          },
                        ),
                        const SizedBox(width: 20.0),
                        trophyButton(
                          context, // Pass the BuildContext here
                          const Color(0xff131212),
                          const Color(0xffE28C43),
                          'TROPHY LADDER',
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Ladder(), // Navigate to Ladder page
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        ),
        bottomNavigationBar: BottomNavBar(onItemSelected: (index) {
          // Handle navigation item selection
        }),
        backgroundColor: const Color(0xffFDFEFF),
      ),
    );
  }
}
