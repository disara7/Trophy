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
          await http.get(Uri.parse('http://192.168.1.4/api/Hackathons'));
      if (response.statusCode == 200) {
        final List<dynamic>? data = jsonDecode(response.body);
        if (data != null) {
          final List<Hackathon> hackathons =
              data.map((json) => Hackathon.fromJson(json)).toList();
          emit(HackathonsLoaded(hackathons));
        } else {
          emit(const HackathonsLoadFailure("No data found"));
        }
      } else {
        emit(const HackathonsLoadFailure("Failed to load hackathons"));
      }
    } catch (e) {
      emit(HackathonsLoadFailure(e.toString()));
    }
  }
}
