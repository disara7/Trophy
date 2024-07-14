import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/extensions.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/embeds/widgets/image.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:flutter_quill_extensions/models/config/video/editor/youtube_video_support_mode.dart';
import 'package:trophy/Components/main_appbar.dart';

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
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  controller: controller,
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
                        videoEmbedConfigurations: QuillEditorVideoEmbedConfigurations(
                          youtubeVideoSupportMode: isDesktop(supportWeb: false)
                              ? YoutubeVideoSupportMode.customPlayerWithDownloadUrl
                              : YoutubeVideoSupportMode.iframeView,
                        ),
                      )),
                    ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
