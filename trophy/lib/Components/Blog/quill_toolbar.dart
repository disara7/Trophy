import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';

class MyQuillToolbar extends StatelessWidget {
  final QuillController controller; // Replace with your controller type

  const MyQuillToolbar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuillToolbar.simple(
      configurations: QuillSimpleToolbarConfigurations(
          controller: controller,
          multiRowsDisplay: true,
          searchButtonType: SearchButtonType.modern,
          embedButtons: FlutterQuillEmbeds.toolbarButtons(
              imageButtonOptions: const QuillToolbarImageButtonOptions()),
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
