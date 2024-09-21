import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:trophy/Components/main_appbar.dart';
import 'package:trophy/Components/member_card.dart';
import 'package:trophy/constants.dart';

class Community extends StatefulWidget {
  final VoidCallback openDrawer;

  const Community({super.key, required this.openDrawer});

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  List<dynamic> members = [];
  int coinCount = 0;

  @override
  void initState() {
    super.initState();
    fetchMembers();
    fetchCoinCount();
  }

  Future<void> fetchMembers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authToken');

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final response = await http.get(
      Uri.parse('$baseUrl/api/getOtherEmployee'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      setState(() {
        members = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load members');
    }
  }

  Future<void> fetchCoinCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authToken');

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final response = await http.get(
      Uri.parse('$baseUrl/api/coin'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        coinCount = data['coinCount'];
      });
    } else {
      print(response);
      throw Exception('Failed to load coin count');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "COMMUNITY",
        leadingIcon: Icons.menu,
        onLeadingPressed: widget.openDrawer,
        actionIcon: Icons.account_circle,
        onActionPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Color.fromARGB(0, 175, 171, 171)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  color: const Color(0xFF222222),
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'COINS COLLECTED',
                              style: TextStyle(color: Color.fromARGB(255, 240, 156, 70), fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Send the collected coins to other colleagues.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/Coin.png',
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '$coinCount',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Display the member card
            Expanded(
              child: members.isNotEmpty
                  ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.68,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 2,
                ),
                itemCount: members.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    imageUrl: members[index]['imageUrl'],
                    title: members[index]['employeeName'],
                    onTap: () {
                      // Handle card tap
                    },
                  );
                },
              )
                  : const Center(child: CircularProgressIndicator()),
            ),

          ],
        ),
      ),
    );
  }
}
