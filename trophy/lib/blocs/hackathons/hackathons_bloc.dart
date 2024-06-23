import 'package:flutter_bloc/flutter_bloc.dart';
import 'hackathons_event.dart';
import 'hackathons_state.dart';

class HackathonsBloc extends Bloc<HackathonsEvent, HackathonState> {
  HackathonsBloc() : super(HackathonsInitial()) {
    on<LoadHackathons>(_onLoadHackathons);
  }

  Future<void> _onLoadHackathons(
      LoadHackathons event, Emitter<HackathonState> emit) async {
    emit(HackathonsLoading());
    try {
      final activities = [
        Hackathon(
          hacktitle: 'EMPLOmindHACK',
          hackdescription:
              'Inter-department idea hackathon for employees to promote new idea expression within individuals ',
          hackimageUrl: 'assets/leaves.png',
          hackcoinCount: 20,
        ),

        Hackathon(
          hacktitle: 'EMPLOmindHACK',
          hackdescription:
              'Inter-department idea hackathon for employees to promote new idea expression within individuals ',
          hackimageUrl: 'assets/leaves.png',
          hackcoinCount: 20,
        ),

        Hackathon(
          hacktitle: 'EMPLOmindHACK',
          hackdescription:
              'Inter-department idea hackathon for employees to promote new idea expression within individuals ',
          hackimageUrl: 'assets/leaves.png',
          hackcoinCount: 20,
        ),

        Hackathon(
          hacktitle: 'EMPLOmindHACK',
          hackdescription:
              'Inter-department idea hackathon for employees to promote new idea expression within individuals ',
          hackimageUrl: 'assets/leaves.png',
          hackcoinCount: 20,
        ),

        // Add more activities as needed
      ];
      emit(HackathonsLoaded(activities));
    } catch (e) {
      emit(HackathonsError());
    }
  }
}
