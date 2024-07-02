import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:trophy/blocs/therapy/chat/chat_bloc.dart';
import 'package:trophy/models/chat_model.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import '../../themes/color_palette.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final ChatBloc chatBloc = ChatBloc();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<ChatBloc, ChatState>(
            bloc: chatBloc,
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.runtimeType) {
                case ChatSuccessState:
                  List<ChatModel> message = (state as ChatSuccessState).message;
                  return Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                          height: 95,
                          color: Colors.white,
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        child: Image.asset(
                                            'assets/cat_avatar.png'),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Julian",
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.arrow_back_ios),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: ListView.builder(
                                itemCount: message.length,
                                itemBuilder: (context, index) {
                                  return Align(
                                    alignment: message[index].role == "user"
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: (MediaQuery.sizeOf(context)
                                                  .width -
                                              80)),
                                      margin: EdgeInsets.only(
                                          bottom: 15, right: 13, left: 13),
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          color: message[index].role == "user"
                                              ? Palette.appOrange
                                              : Color(0xfff6f6f6),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: Offset(0, 0),
                                            ),
                                          ]),
                                      child: Column(
                                        crossAxisAlignment:
                                            message[index].role == "user"
                                                ? CrossAxisAlignment.end
                                                : CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      message[index].role ==
                                                              "model"
                                                          ? "Julian"
                                                          : '',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: message[
                                                                          index]
                                                                      .role ==
                                                                  "user"
                                                              ? 0
                                                              : 14,
                                                          color: message[index]
                                                                      .role ==
                                                                  "user"
                                                              ? Colors.red
                                                              : Colors.blue),
                                                    ),
                                                    Text(
                                                      message[index]
                                                          .parts
                                                          .first
                                                          .text,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 15,
                                                          color: message[index]
                                                                      .role ==
                                                                  "user"
                                                              ? Colors.white
                                                              : Colors.black87),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                })),
                        if (chatBloc.generating)
                          Container(
                              width: 300,
                              child: Lottie.asset('assets/Chat_loader.json')),
                        Container(
                          padding: EdgeInsets.all(10),
                          color: Palette.appWhite,
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: TextField(
                                    controller: textEditingController,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        borderSide: BorderSide(
                                            width: 0, style: BorderStyle.none),
                                      ),
                                      hintText: 'Ask me anything...',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.3)),
                                      filled: true,
                                      fillColor: Color(0xfff3f3f3),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              InkWell(
                                onTap: () {
                                  if (textEditingController.text.isNotEmpty) {
                                    String text = textEditingController.text;
                                    textEditingController.clear();
                                    chatBloc.add(
                                        ChatGenerateNewTextMessageEvent(
                                            inputMessage: text));
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Palette.appOrange,
                                  child: Center(
                                    child: Icon(
                                      Icons.send,
                                      color: Palette.appWhite,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                default:
                  return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
