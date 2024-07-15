import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trophy/Components/Blog/blog_submit.dart';
import 'package:trophy/Components/Blog/draft_save.dart';
import 'package:trophy/Components/Blog/quill_editor.dart';
import 'package:trophy/Components/Blog/quill_toolbar.dart';
import 'package:trophy/Components/Blog/textfeild.dart';
import 'package:trophy/Components/button.dart';
import 'package:trophy/Components/main_appbar.dart';
import 'package:trophy/Screens/blog_preview.dart';
import 'package:trophy/Screens/my_blog.dart';

const filepath = "../Components/Blog/Assets";

class BlogWritingPage extends StatefulWidget {
  final String draftJson;
  const BlogWritingPage({super.key, required this.draftJson});

  @override
  State<BlogWritingPage> createState() => _BlogWritingPageState();
}

QuillController _controller = QuillController.basic();

class _BlogWritingPageState extends State<BlogWritingPage> {
  final List<String> categories = ['NEWS', 'Marketing', 'Strategy', 'Automation', 'Other'];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  String? _selectedCategory;
  String? _currentDraftKey;

  @override
  void initState() {
    super.initState();
    _loadDraft();
  }

  void _loadDraft() {
    if (widget.draftJson.isNotEmpty) {
      final draft = BlogDraft.fromJson(jsonDecode(widget.draftJson));
      _titleController.text = draft.title;
      _subtitleController.text = draft.subtitle;
      _selectedCategory = draft.category;
      _controller = QuillController(
        document: Document.fromJson(jsonDecode(draft.content)),
        selection: const TextSelection.collapsed(offset: 0),
      );
      _currentDraftKey = draft.id;
    }
  }

  void _clearData() {
    _titleController.clear();
    _subtitleController.clear();
    _selectedCategory = null;
    _controller = QuillController.basic();
  }

  Future<String> _saveDraft() async {
    final currentDraftKey = 'blogDraft${DateTime.now().toString()}';
    final draft = BlogDraft.fromState(_titleController.text, _subtitleController.text, _selectedCategory!, _controller, currentDraftKey);
    final draftJson = jsonEncode(draft);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(currentDraftKey, draftJson);
    return currentDraftKey;
  }

  Future<void> _deleteDraft() async {
    if (_currentDraftKey != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_currentDraftKey!);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "BLOG",
        leadingIcon: Icons.arrow_back_ios,
        onLeadingPressed: () {
          _clearData();
          Navigator.pop(context);
        },
        actionIcon: Icons.view_agenda,
        onActionPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlogPreviewPage(
                title: _titleController.text,
                subtitle: _subtitleController.text,
                controller: _controller,
              ),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              MyTextField(
                labelText: 'Title',
                controller: _titleController,
                maxLength: 50,
              ),
              const SizedBox(height: 10.0),
              MyTextField(
                labelText: 'Subtitle (optional)',
                controller: _subtitleController,
                maxLength: 100,
              ),
              const SizedBox(height: 10.0),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 156, 70),
                    ),
                  ),
                ),
                items: categories.map((category) => DropdownMenuItem(
                  value: category,
                  child: Text(category),
                )).toList(),
                value: _selectedCategory,
                hint: const Text('Select Category'),
                onChanged: (String? value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const SizedBox(height: 10.0),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0x22222222),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(16.0), topLeft: Radius.circular(16.0)),
                ),
                child: MyQuillToolbar(controller: _controller)
              ),
              Container(
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0)),
                  border: Border.all(
                    color: const Color(0x22222222),
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: MyQuillEditor(controller: _controller,)
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  customButton(
                    backgroundColor: const Color(0xFF222222),
                    textColor: const Color.fromARGB(255, 240, 156, 70),
                    text: 'SAVE DRAFT',
                    onPressed: () async {
                      await _saveDraft();
                      _clearData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyBlogs(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10.0),
                  customButton(
                    backgroundColor: const Color.fromARGB(255, 240, 156, 70),
                    textColor: const Color(0xFF222222),
                    text: 'SUBMIT',
                    onPressed: () async {
                      await submitBlog(_titleController.text, _subtitleController.text, _selectedCategory!, _controller);
                      await _deleteDraft();
                      _clearData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyBlogs(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
