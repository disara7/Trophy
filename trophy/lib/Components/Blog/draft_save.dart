import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';

class BlogDraft {
  final String title;
  final String subtitle;
  final String category;
  final String content;
  final String id;

  BlogDraft({
    required this.title,
    required this.subtitle,
    required this.category,
    required this.content,
    required this.id,
  });

  factory BlogDraft.fromState(String title, String subtitle, String category, QuillController controller, String id) {
    return BlogDraft(
      title: title,
      subtitle: subtitle,
      category: category,
      content: jsonEncode(controller.document.toDelta().toJson()),
      id: id,
    );
  }

  factory BlogDraft.fromJson(Map<String, dynamic> json) {
    return BlogDraft(
      title: json['title'],
      subtitle: json['subtitle'],
      category: json['category'],
      content: json['content'],
      id: json['id']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'category': category,
      'content': content,
      'id': id
    };
  }
}
