import 'package:flutter_bloc/flutter_bloc.dart';
import 'sports_event.dart';
import 'sports_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'sport.dart';

class SportsBloc extends Bloc<SportsEvent, SportsState> {
  SportsBloc() : super(SportsInitial()) {
    on<LoadSports>(_onLoadActivities);
  }

  Future<void> _onLoadActivities(
      LoadSports event, Emitter<SportsState> emit) async {
    emit(SportsLoading());

    try {
      final response =
          await http.get(Uri.parse('http://192.168.1.4/api/Sports'));
      if (response.statusCode == 200) {
        final List<dynamic>? data =
            jsonDecode(response.body); // Ensure data is nullable
        if (data != null) {
          final List<Sport> activities = data
              .map((json) => Sport.fromJson(json))
              .toList(); // Assuming Sport.fromJson is correctly implemented
          emit(SportsLoaded(activities));
        } else {
          emit(const SportsLoadFailure("No data found"));
        }
      } else {
        emit(const SportsLoadFailure("Failed to load sports"));
      }
    } catch (e) {
      emit(SportsLoadFailure(e.toString()));
    }
  }
}
