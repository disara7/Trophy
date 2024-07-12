import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trophy/models/chat_model.dart';
import 'package:trophy/repo/chat_repo.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatSuccessState(message: [])) {
    on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
  }
  List<ChatModel> message = [];
  bool generating = false;

  FutureOr<void> chatGenerateNewTextMessageEvent(
      ChatGenerateNewTextMessageEvent event, Emitter<ChatState> emit) async {
    message.add(ChatModel(
        role: "user", parts: [ChatPartModel(text: event.inputMessage)]));
    emit(ChatSuccessState(message: message));
    generating = true;
    String genaratedText = await ChatRepo.chatTextGenerationRepo(message);
    if (genaratedText.length > 0) {
      message.add(ChatModel(
          role: 'model', parts: [ChatPartModel(text: genaratedText)]));
      emit(ChatSuccessState(message: message));
    }
    generating = false;
  }
}
