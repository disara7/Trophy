import 'dart:convert';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> submitBlog(String title, String subtitle, String category, QuillController controller, String state, String date) async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('authToken');

  final url = Uri.parse('http://172.20.10.2/api/addblog'); // Replace with 172.20.10.2

  // Prepare the blog content in JSON format
  final content = jsonEncode(controller.document.toDelta().toJson());

  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode({
      'title': title,
      'subtitle': subtitle,
      'category': category,
      'content': content,
      'state': state,
      'date': date,
    }),
  );

  if (response.statusCode == 201) {
    print('Blog submitted successfully!');
  } else {
    print('Error submitting blog: ${response.statusCode}');
  }
}
