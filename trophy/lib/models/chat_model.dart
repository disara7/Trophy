// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatModel {
  final String role;
  final List<ChatPartModel> parts;
  ChatModel({
    required this.role,
    required this.parts,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'parts': parts.map((x) => x.toMap()).toList(),
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      role: map['role'] as String,
      parts: List<ChatPartModel>.from(
        (map['parts'] as List<int>).map<ChatPartModel>(
          (x) => ChatPartModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ChatPartModel {
  final String text;
  ChatPartModel({
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
    };
  }

  factory ChatPartModel.fromMap(Map<String, dynamic> map) {
    return ChatPartModel(
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatPartModel.fromJson(String source) =>
      ChatPartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
