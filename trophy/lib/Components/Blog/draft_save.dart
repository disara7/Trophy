import 'dart:convert';
import 'package:flutter_quill/flutter_quill.dart';

class BlogDraft {
  final String id;
  final String title;
  final String subtitle;
  final String category;
  final String content;
  final String? imagePath;

  BlogDraft({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.content,
    this.imagePath,
  });

  factory BlogDraft.fromState(String title, String subtitle, String category,
      QuillController controller, String id, String? imagePath) {
    return BlogDraft(
      id: id,
      title: title,
      subtitle: subtitle,
      category: category,
      content: jsonEncode(controller.document.toDelta().toJson()),
      imagePath: imagePath,
    );
  }

  factory BlogDraft.fromJson(Map<String, dynamic> json) {
    return BlogDraft(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      category: json['category'],
      content: json['content'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'category': category,
      'content': content,
      'imagePath': imagePath,
    };
  }
}