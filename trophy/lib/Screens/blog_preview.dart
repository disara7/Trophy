import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:trophy/Components/main_appbar.dart';

import '../Components/Blog/quill_editor.dart';

class BlogPreviewPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final QuillController controller;
  final bool readOnly = true;

  const BlogPreviewPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    controller.readOnly = readOnly;
    return Scaffold(
      appBar: CustomAppBar(
          title: "PREVIEW",
          leadingIcon: Icons.arrow_back_ios,
          onLeadingPressed: (){
            Navigator.pop(context);
          },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 240, 156, 70)
              ),
            ),
            if (subtitle.isNotEmpty)
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Color(0xFF222222)
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: MyQuillEditor(controller: controller,)
            ),
          ],
        ),
      ),
    );
  }
}
