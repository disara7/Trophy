import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:trophy/blocs/hackathons/hackathons_bloc.dart';
import 'package:trophy/blocs/hackathons/hackathons_event.dart';
import 'package:trophy/blocs/hackathons/hackathons_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('HackathonsBloc', () {
    late HackathonsBloc hackathonsBloc;
    late MockHttpClient mockHttpClient;

    setUp(() {
      mockHttpClient = MockHttpClient();
      hackathonsBloc = HackathonsBloc();
    });

    test('initial state is HackathonsInitial', () {
      expect(hackathonsBloc.state, HackathonsInitial());
    });



  });
}
