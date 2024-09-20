import 'package:flutter_bloc/flutter_bloc.dart';
import 'activities_event.dart';
import 'activities_state.dart';
import 'activity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivitiesState> {
  ActivitiesBloc() : super(ActivitiesInitial()) {
    on<LoadActivities>(_onLoadActivities);
  }

  Future<void> _onLoadActivities(
      LoadActivities event, Emitter<ActivitiesState> emit) async {
    emit(ActivitiesLoading());
    try {
      final response =
          await http.get(Uri.parse('http://192.168.1.4/api/Activities'));
      if (response.statusCode == 200) {
        final List<dynamic>? data =
            jsonDecode(response.body); // Ensure data is nullable
        if (data != null) {
          final List<Activity> activities = data
              .map((json) => Activity.fromJson(json))
              .toList(); // Assuming Activity.fromJson is correctly implemented
          emit(ActivitiesLoaded(activities));
        } else {
          emit(const ActivitiesLoadFailure('Data is null or empty'));
        }
      } else {
        emit(const ActivitiesLoadFailure('Failed to load activities'));
      }
    } catch (e) {
      emit(ActivitiesLoadFailure('Error loading activities: $e'));
    }
  }
}
