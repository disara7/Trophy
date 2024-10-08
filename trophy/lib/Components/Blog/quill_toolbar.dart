// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
// import 'package:image_picker/image_picker.dart';

class MyQuillToolbar extends StatelessWidget {
  final QuillController controller;

  const MyQuillToolbar({super.key, required this.controller});


  @override
  Widget build(BuildContext context) {
    return QuillToolbar.simple(
      configurations: QuillSimpleToolbarConfigurations(
          controller: controller,
          multiRowsDisplay: true,
          searchButtonType: SearchButtonType.modern,
          // embedButtons: FlutterQuillEmbeds.toolbarButtons(
          //     imageButtonOptions: const QuillToolbarImageButtonOptions()),
          buttonOptions: const QuillSimpleToolbarButtonOptions(
              base: QuillToolbarBaseButtonOptions(
                  iconTheme: QuillIconTheme(
                      iconButtonSelectedData: IconButtonData(
            color: Color(0xFF222222),
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xffE28C43))),
          ))))),
    );
  }
}
