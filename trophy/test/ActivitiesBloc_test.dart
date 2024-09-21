import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import '../lib/blocs/activities/activities_bloc.dart';
import '../lib/blocs/activities/activities_event.dart';
import '../lib/blocs/activities/activities_state.dart';



void main() {

  group('ActivitiesBloc', () {
    late ActivitiesBloc activitiesBloc;

    setUp(() {
      activitiesBloc = ActivitiesBloc(); // No parameters needed
    });

    tearDown(() {
      activitiesBloc.close();
    });

    test('initial state is ActivitiesInitial', () {
      expect(activitiesBloc.state, ActivitiesInitial());
    });

    blocTest<ActivitiesBloc, ActivitiesState>(
      'emits [ActivitiesError] when LoadActivitiesEvent fails',
      build: () => activitiesBloc,
      act: (bloc) => bloc.add(LoadActivities()), // Mock failure scenario
      expect: () => [
        ActivitiesLoading(),
      ],
    );

  });
}
