import 'package:flutter_bloc/flutter_bloc.dart';
import 'hackathons_event.dart';
import 'hackathons_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'hackathon.dart';

class HackathonsBloc extends Bloc<HackathonsEvent, HackathonState> {
  HackathonsBloc() : super(HackathonsInitial()) {
    on<LoadHackathons>(_onLoadHackathons);
  }

  Future<void> _onLoadHackathons(
      LoadHackathons event, Emitter<HackathonState> emit) async {
    emit(HackathonsLoading());
    try {
      final response =
          await http.get(Uri.parse('http://13.51.177.135/hack/Hackathons'));
      if (response.statusCode == 200) {
        final List<dynamic>? data = jsonDecode(response.body);
        if (data != null) {
          final List<Hackathon> hackathons =
              data.map((json) => Hackathon.fromJson(json)).toList();
          emit(HackathonsLoaded(hackathons));
        } else {
          emit(const HackathonsError("No data found"));
        }
      } else {
        emit(const HackathonsError("Failed to load hackathons"));
      }
    } catch (e) {
      emit(HackathonsError(e.toString()));
    }
  }
}
