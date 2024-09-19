import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';

class MyQuillToolbar extends StatelessWidget {
  final QuillController controller; // Replace with your controller type

  const MyQuillToolbar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return QuillToolbar.simple(
      configurations: QuillSimpleToolbarConfigurations(
        controller: controller,
        multiRowsDisplay: true,
        searchButtonType: SearchButtonType.modern,
        embedButtons: FlutterQuillEmbeds.toolbarButtons(
          imageButtonOptions: const QuillToolbarImageButtonOptions(),
        ),
        buttonOptions: QuillSimpleToolbarButtonOptions(
          base: QuillToolbarBaseButtonOptions(
            iconTheme: QuillIconTheme(
              iconButtonSelectedData: IconButtonData(
                color: const Color(0xFF222222),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xffE28C43)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
