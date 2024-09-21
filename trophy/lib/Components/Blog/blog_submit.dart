import 'dart:convert';
import 'dart:io';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';
import 'package:trophy/constants.dart';

Future<void> submitBlog({
  required String title,
  required String subtitle,
  required String category,
  required QuillController controller,
  required String state,
  required String date,
  File? image,
}) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');
    if (token == null) {
      throw Exception('Authentication token not found');
    }

    final url = Uri.parse('$baseUrl/api/addblog');
    final content = jsonEncode(controller.document.toDelta().toJson());

    final request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = 'Bearer $token'
      ..fields['title'] = title
      ..fields['subtitle'] = subtitle
      ..fields['category'] = category
      ..fields['content'] = content
      ..fields['state'] = state
      ..fields['date'] = date;

    if (image != null) {
      final compressedImage = await _compressImage(image);
      final imageFileName = path.basename(image.path);
      final imageExtension = path.extension(image.path).toLowerCase();
      final mimeType = _getMimeType(imageExtension);

      request.files.add(
        http.MultipartFile.fromBytes(
          'image',
          compressedImage,
          filename: imageFileName,
          contentType: MediaType.parse(mimeType),
        ),
      );
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 201) {
      print('Blog submitted successfully!');
    } else {
      print('Error submitting blog: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to submit blog');
    }
  } catch (e) {
    print('Exception occurred while submitting blog: $e');
    rethrow;
  }
}

Future<List<int>> _compressImage(File imageFile) async {
  final compressedImage = await FlutterImageCompress.compressWithFile(
    imageFile.absolute.path,
    quality: 85,
    format: CompressFormat.jpeg,
  );
  if (compressedImage == null) {
    throw Exception('Failed to compress image');
  }
  return compressedImage;
}

String _getMimeType(String extension) {
  switch (extension) {
    case '.jpg':
    case '.jpeg':
      return 'image/jpeg';
    case '.png':
      return 'image/png';
    case '.gif':
      return 'image/gif';
    default:
      return 'application/octet-stream';
  }
}