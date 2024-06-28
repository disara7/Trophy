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
          hackathondetails:
              'The annual cricket match of ABC Company is a highly anticipated event that fosters a sense of unity and camaraderie among employees. From the moment the first ball is bowled, the atmosphere is electric, with players displaying their skills and spectators cheering on their favorite teams. The match serves as a platform for employees from different departments to come together, build relationships, and celebrate their shared passion for the sport. Beyond the cricketing action, the event offers a range of activities and entertainment for attendees. Food stalls with a variety of delectable treats, music, and engaging games create a festive ambiance. The annual cricket match of ABC Company not only promotes physical activity and healthy competition but also serves as a day of relaxation and enjoyment for employees and their families. It has become an integral part of the company',
          hackathonmainimgUrl: 'assets/Cricket.png',
        ),
        Hackathon(
          hacktitle: 'EMPLOmindHACK',
          hackdescription:
              'Inter-department idea hackathon for employees to promote new idea expression within individuals ',
          hackimageUrl: 'assets/leaves.png',
          hackcoinCount: 20,
          hackathondetails:
              'The annual cricket match of ABC Company is a highly anticipated event that fosters a sense of unity and camaraderie among employees. From the moment the first ball is bowled, the atmosphere is electric, with players displaying their skills and spectators cheering on their favorite teams. The match serves as a platform for employees from different departments to come together, build relationships, and celebrate their shared passion for the sport. Beyond the cricketing action, the event offers a range of activities and entertainment for attendees. Food stalls with a variety of delectable treats, music, and engaging games create a festive ambiance. The annual cricket match of ABC Company not only promotes physical activity and healthy competition but also serves as a day of relaxation and enjoyment for employees and their families. It has become an integral part of the company',
          hackathonmainimgUrl: 'assets/Cricket.png',
        ),

        Hackathon(
          hacktitle: 'EMPLOmindHACK',
          hackdescription:
              'Inter-department idea hackathon for employees to promote new idea expression within individuals ',
          hackimageUrl: 'assets/leaves.png',
          hackcoinCount: 20,
          hackathondetails:
              'The annual cricket match of ABC Company is a highly anticipated event that fosters a sense of unity and camaraderie among employees. From the moment the first ball is bowled, the atmosphere is electric, with players displaying their skills and spectators cheering on their favorite teams. The match serves as a platform for employees from different departments to come together, build relationships, and celebrate their shared passion for the sport. Beyond the cricketing action, the event offers a range of activities and entertainment for attendees. Food stalls with a variety of delectable treats, music, and engaging games create a festive ambiance. The annual cricket match of ABC Company not only promotes physical activity and healthy competition but also serves as a day of relaxation and enjoyment for employees and their families. It has become an integral part of the company',
          hackathonmainimgUrl: 'assets/Cricket.png',
        ),

        Hackathon(
          hacktitle: 'EMPLOmindHACK',
          hackdescription:
              'Inter-department idea hackathon for employees to promote new idea expression within individuals ',
          hackimageUrl: 'assets/leaves.png',
          hackcoinCount: 20,
          hackathondetails:
              'The annual cricket match of ABC Company is a highly anticipated event that fosters a sense of unity and camaraderie among employees. From the moment the first ball is bowled, the atmosphere is electric, with players displaying their skills and spectators cheering on their favorite teams. The match serves as a platform for employees from different departments to come together, build relationships, and celebrate their shared passion for the sport. Beyond the cricketing action, the event offers a range of activities and entertainment for attendees. Food stalls with a variety of delectable treats, music, and engaging games create a festive ambiance. The annual cricket match of ABC Company not only promotes physical activity and healthy competition but also serves as a day of relaxation and enjoyment for employees and their families. It has become an integral part of the company',
          hackathonmainimgUrl: 'assets/Cricket.png',
        ),

        // Add more activities as needed
      ];
      emit(HackathonsLoaded(activities));
    } catch (e) {
      emit(HackathonsError());
    }
  }
}
