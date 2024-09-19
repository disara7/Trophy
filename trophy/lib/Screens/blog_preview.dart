import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:trophy/Components/main_appbar.dart';

import '../Components/Blog/quill_editor.dart';

class BlogPreviewPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final QuillController controller;
  final File? image;
  final bool readOnly = true;

  const BlogPreviewPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.controller,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    controller.readOnly = readOnly;
    return Scaffold(
      appBar: CustomAppBar(
        title: "PREVIEW",
        leadingIcon: Icons.arrow_back_ios,
        onLeadingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.file(
                    image!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 240, 156, 70)
                ),
              ),
              if (subtitle.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Color(0xB3603F1F)
                  ),
                ),
              ],
              const SizedBox(height: 16),
              SizedBox(
                height: MediaQuery.of(context).size.height - 400,
                child: MyQuillEditor(controller: controller),
              ),
            ],
          ),
        ),
      ),
    );
  }
}