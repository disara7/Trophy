import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:trophy/blocs/home/bloc.dart';
import 'package:trophy/blocs/home/event.dart';
import 'package:trophy/blocs/home/state.dart';
import 'package:trophy/blocs/home/fetchdata.dart';

class MockHomeBloc extends Mock implements HomeBloc {}

void main() {
  group('HomeBloc', () {
    late HomeBloc homeBloc;

    setUp(() {
      homeBloc = HomeBloc();
    });

    test('initial state is HomeState with default values', () {
      expect(homeBloc.state, const HomeState(coins: 0, dailyChallenge: 10, completedChallenges: 0, level: 0));
    });

    blocTest<HomeBloc, HomeState>(
      'emits updated state when UpdateCoins is added',
      build: () => homeBloc,
      act: (bloc) => bloc.add(UpdateCoins(50)),
      expect: () => [
        const HomeState(coins: 50, dailyChallenge: 10, completedChallenges: 0, level: 0),
      ],
    );

    // You can add more tests for other events like UpdateDailyChallenge, UpdateCompletedChallenges, and UpdateLevel here.
  });
}
