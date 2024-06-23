import 'package:flutter_bloc/flutter_bloc.dart';
import 'activities_event.dart';
import 'activities_state.dart';

class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivitiesState> {
  ActivitiesBloc() : super(ActivitiesInitial()) {
    on<LoadActivities>(_onLoadActivities);
  }

  Future<void> _onLoadActivities(
      LoadActivities event, Emitter<ActivitiesState> emit) async {
    emit(ActivitiesLoading());
    try {
      final activities = [
        Activity(
          title: 'EmploInpire',
          description: 'Soft skills development workshop',
          imageUrl:
              'assets/soft-skills.png', // Replace with correct imageUrl path
          coinCount: 20,
        ),
        Activity(
          title: 'Sports Event',
          description: 'Participate in the annual sports meet',
          imageUrl:
              'assets/soft-skills.png', // Replace with correct imageUrl path
          coinCount: 30,
        ),

        Activity(
          title: 'Sports Event',
          description: 'Participate in the annual sports meet',
          imageUrl:
              'assets/soft-skills.png', // Replace with correct imageUrl path
          coinCount: 30,
        ),

        Activity(
          title: 'Sports Event',
          description: 'Participate in the annual sports meet',
          imageUrl:
              'assets/soft-skills.png', // Replace with correct imageUrl path
          coinCount: 30,
        ),
        Activity(
          title: 'Sports Event',
          description: 'Participate in the annual sports meet',
          imageUrl:
              'assets/soft-skills.png', // Replace with correct imageUrl path
          coinCount: 30,
        ),
        Activity(
          title: 'Sports Event',
          description: 'Participate in the annual sports meet',
          imageUrl:
              'assets/soft-skills.png', // Replace with correct imageUrl path
          coinCount: 30,
        ),
        // Add more activities as needed
      ];
      emit(ActivitiesLoaded(activities));
    } catch (e) {
      emit(ActivitiesError());
    }
  }
}
