import 'package:flutter_test/flutter_test.dart';
import 'package:trophy/blocs/therapy/chat/chat_bloc.dart';
import 'package:trophy/models/chat_model.dart';

void main() {
  late ChatBloc chatBloc;

  setUp(() {
    chatBloc = ChatBloc();
  });

  tearDown(() {
    chatBloc.close();
  });

  test('Initial state is ChatSuccessState with empty messages', () {
    expect(chatBloc.state, isA<ChatSuccessState>());
    final currentState = chatBloc.state as ChatSuccessState;
    expect(currentState.message.isEmpty, true);
  });

  test('ChatGenerateNewTextMessageEvent adds user message to state', () {
    const inputMessage = 'Hello, how are you?';
    chatBloc.add(ChatGenerateNewTextMessageEvent(inputMessage: inputMessage));

    expectLater(
      chatBloc.stream,
      emitsInOrder([
        isA<ChatSuccessState>().having(
              (state) => (state as ChatSuccessState).message.last.parts.first.text,
          'Last message is user input',
          inputMessage,
        ),
      ]),
    );
  });


}
