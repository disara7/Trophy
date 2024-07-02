import 'package:http/http.dart' as http;
import 'dart:convert';
import 'state.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<HomeState> fetchHomeState() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('authToken');

  final response = await http.get(
    Uri.parse('http://your-backend-url/api/homeState'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': token ?? '',
    },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return HomeState(
      coins: data['coins'] ?? 0,
      dailyChallenge: data['dailyChallenge'] ?? 10,
      completedChallenges: data['completedChallenges'] ?? 0,
      level: data['level'] ?? 1,
    );
  } else {
    throw Exception('Failed to load home state');
  }
}
