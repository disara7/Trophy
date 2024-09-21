import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trophy/constants.dart';

Future<void> addCoinsToBank(int coinAmount) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authToken');

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    String apiUrl = '$baseUrl/api/addCoins';

    Map<String, dynamic> requestBody = {
      'amount': coinAmount,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: json.encode(requestBody),
    );

    // Handle the response
    if (response.statusCode == 200) {
      print('Coins added successfully: ${response.body}');
    } else {
      print('Failed to add coins: ${response.body}');
    }
  } catch (e) {
    print('Error adding coins to bank: $e');
  }
}
