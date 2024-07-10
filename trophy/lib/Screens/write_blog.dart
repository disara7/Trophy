
import 'package:cached_network_image/cached_network_image.dart' show CachedNetworkImageProvider;
import 'package:flutter/material.dart';
import 'package:flutter_quill/extensions.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/embeds/widgets/image.dart';
import 'package:flutter_quill_extensions/models/config/video/editor/youtube_video_support_mode.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trophy/Components/button.dart';
import 'package:trophy/Components/main_appbar.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
const filepath = "../Components/Blog/Assets";


class BlogWritingPage extends StatefulWidget {
  const BlogWritingPage({Key? key}) : super(key: key);

  @override
  State<BlogWritingPage> createState() => _BlogWritingPageState();
}

QuillController _controller = QuillController.basic();

class _BlogWritingPageState extends State<BlogWritingPage> {
  final List<String> categories = [
    'NEWS','Marketing','Strategy','Automation','Other'
  ];
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            title: "BLOG",
            leadingIcon: Icons.arrow_back_ios,
            onLeadingPressed: (){
              Navigator.pop(context);
            },
            actionIcon: Icons.view_agenda,
            onActionPressed: (){}
        ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 156, 70),
                    ),
                  )
                ),
                maxLength: 50,
                maxLines: null,
              ),
              const SizedBox(height: 10.0),
              const TextField(
                decoration: InputDecoration(
                    labelText: 'Subtitle (optional)',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 240, 156, 70),
                      ),
                    )
                ),
                maxLength: 100,
                maxLines: null,
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
                value: null,
                hint: const Text('Select Category'),
                onChanged: (String? value) {  },
              ),
              const SizedBox(height: 10.0),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0x22222222),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(16.0), topLeft: Radius.circular(16.0)),
                ),
                child: QuillToolbar.simple(
                  configurations: QuillSimpleToolbarConfigurations(
                    controller: _controller,
                    multiRowsDisplay: true,
                    searchButtonType: SearchButtonType.modern,
                    embedButtons: FlutterQuillEmbeds.toolbarButtons(
                      imageButtonOptions: const QuillToolbarImageButtonOptions()
                    ),
                  ),
                ),
              ),
              Container(
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0)),
                  border: Border.all(
                    color: const Color(0x22222222),
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: QuillEditor.basic(
                    configurations: QuillEditorConfigurations(
                      controller: _controller,
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
                              // cached_network_image is supported
                              // only for Android, iOS and web

                              // We will use it only if image from network
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
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  customButton(
                    backgroundColor: const Color(0xFF222222),
                    textColor: const Color.fromARGB(255, 240, 156, 70),
                    text: 'SAVE DRAFT',
                    onPressed: () {

                    },
                  ),
                  const SizedBox(width: 10.0),
                  customButton(
                    backgroundColor: const Color.fromARGB(255, 240, 156, 70),
                    textColor: const Color(0xFF222222),
                    text: 'SUBMIT',
                    onPressed: () {

                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}