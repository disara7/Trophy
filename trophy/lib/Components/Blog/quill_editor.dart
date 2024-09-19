import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/extensions.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/embeds/widgets/image.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';

class MyQuillEditor extends StatelessWidget {
  final QuillController controller;

  const MyQuillEditor({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuillEditor.basic(
      configurations: QuillEditorConfigurations(
        controller: controller,
        placeholder: 'Start writing your content here...',
        textSelectionThemeData: const TextSelectionThemeData(
          cursorColor: Color(0xffE28C43),
          selectionColor: Color(0x1de28c43),
          selectionHandleColor: Color.fromARGB(255, 240, 156, 70),
        ),
        embedBuilders: [
          ...(isWeb()
              ? FlutterQuillEmbeds.editorWebBuilders()
              : FlutterQuillEmbeds.editorBuilders(
            imageEmbedConfigurations: QuillEditorImageEmbedConfigurations(
              imageErrorWidgetBuilder: (context, error, stackTrace) {
                return Text(
                  'Error while loading an image: ${error.toString()}',
                );
              },
              imageProviderBuilder: (context, imageUrl) {
                if (isAndroid(supportWeb: false) ||
                    isIOS(supportWeb: false) ||
                    isWeb()) {
                  if (isHttpBasedUrl(imageUrl)) {
                    return CachedNetworkImageProvider(
                      imageUrl,
                    );
                  }
                }
                return getImageProviderByImageSource(
                  imageUrl,
                  imageProviderBuilder: null,
                  context: context,
                  assetsPrefix: QuillSharedExtensionsConfigurations.get(
                      context: context)
                      .assetsPrefix,
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
