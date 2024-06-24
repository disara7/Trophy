import 'package:flutter_bloc/flutter_bloc.dart';
import 'sports_event.dart';
import 'sports_state.dart';

class SportsBloc extends Bloc<SportsEvent, SportsState> {
  SportsBloc() : super(SportsInitial()) {
    on<LoadSports>(_onLoadActivities);
  }

  Future<void> _onLoadActivities(
      LoadSports event, Emitter<SportsState> emit) async {
    emit(SportsLoading());
    try {
      final sports = [
        Sport(
          sporttitle: 'Annual Cricket Match',
          sportdescription: 'Inter department cricket match',
          sportimageUrl:
              'assets/ game.png', // Replace with correct imageUrl path
          sportcoinCount: 12,
        ),

        // Add more activities as needed
      ];
      emit(SportsLoaded(sports));
    } catch (e) {
      emit(SportsError());
    }
  }
}
