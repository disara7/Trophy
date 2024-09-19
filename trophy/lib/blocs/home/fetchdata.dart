import 'package:http/http.dart' as http;
import 'dart:convert';
import 'state.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<HomeState> fetchHomeState() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('authToken');
  try {
    final response = await http.get(
      Uri.parse('http://172.20.10.2/fetch/home'), // Replace with 13.60.28.40
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await Future.delayed(const Duration(seconds: 10));
      fetchHomeState();
      return HomeState(
        coins: data['coins'],
        dailyChallenge: data['dailyChallenge'],
        completedChallenges: data['completedChallenges'],
        level: data['level'],
      );

    } else {
      throw Exception('Failed to load home state');
    }
  } catch (e) {
    print(e.toString());
    // Return a default HomeState object in case of an error
    return const HomeState(
      coins: 0,
      dailyChallenge: 10,
      completedChallenges: 0,
      level: 0,
    );
  }
}
