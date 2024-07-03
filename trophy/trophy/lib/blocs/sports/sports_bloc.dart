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
          sportimageUrl: 'assets/Sport.png',
          sportcoinCount: 12,
          type: 'tournament',
          sportdetails:
              'The annual cricket match of ABC Company is a highly anticipated event that fosters a sense of unity and camaraderie among employees. From the moment the first ball is bowled, the atmosphere is electric, with players displaying their skills and spectators cheering on their favorite teams. The match serves as a platform for employees from different departments to come together, build relationships, and celebrate their shared passion for the sport. Beyond the cricketing action, the event offers a range of activities and entertainment for attendees. Food stalls with a variety of delectable treats, music, and engaging games create a festive ambiance. The annual cricket match of ABC Company not only promotes physical activity and healthy competition but also serves as a day of relaxation and enjoyment for employees and their families. It has become an integral part of the company',
          sportmainimgUrl: 'assets/Cricket.png',
        ),
        Sport(
          sporttitle: 'Annual Cricket Match',
          sportdescription: 'Inter department cricket match',
          sportimageUrl: 'assets/Sport.png',
          sportcoinCount: 12,
          type: 'tournament',
          sportdetails:
              'The annual cricket match of ABC Company is a highly anticipated event that fosters a sense of unity and camaraderie among employees. From the moment the first ball is bowled, the atmosphere is electric, with players displaying their skills and spectators cheering on their favorite teams. The match serves as a platform for employees from different departments to come together, build relationships, and celebrate their shared passion for the sport. Beyond the cricketing action, the event offers a range of activities and entertainment for attendees. Food stalls with a variety of delectable treats, music, and engaging games create a festive ambiance. The annual cricket match of ABC Company not only promotes physical activity and healthy competition but also serves as a day of relaxation and enjoyment for employees and their families. It has become an integral part of the company',
          sportmainimgUrl: 'assets/Cricket.png',
        ),
        Sport(
          sporttitle: 'Annual Cricket Match',
          sportdescription: 'Inter department cricket match',
          sportimageUrl: 'assets/Sport.png',
          sportcoinCount: 12,
          type: 'tournament',
          sportdetails:
              'The annual cricket match of ABC Company is a highly anticipated event that fosters a sense of unity and camaraderie among employees. From the moment the first ball is bowled, the atmosphere is electric, with players displaying their skills and spectators cheering on their favorite teams. The match serves as a platform for employees from different departments to come together, build relationships, and celebrate their shared passion for the sport. Beyond the cricketing action, the event offers a range of activities and entertainment for attendees. Food stalls with a variety of delectable treats, music, and engaging games create a festive ambiance. The annual cricket match of ABC Company not only promotes physical activity and healthy competition but also serves as a day of relaxation and enjoyment for employees and their families. It has become an integral part of the company',
          sportmainimgUrl: 'assets/Cricket.png',
        ),

        Sport(
          sporttitle: 'Annual Cricket Match',
          sportdescription: 'Inter department cricket match',
          sportimageUrl: 'assets/Sport.png',
          sportcoinCount: 12,
          type: 'tournament',
          sportdetails:
              'The annual cricket match of ABC Company is a highly anticipated event that fosters a sense of unity and camaraderie among employees. From the moment the first ball is bowled, the atmosphere is electric, with players displaying their skills and spectators cheering on their favorite teams. The match serves as a platform for employees from different departments to come together, build relationships, and celebrate their shared passion for the sport. Beyond the cricketing action, the event offers a range of activities and entertainment for attendees. Food stalls with a variety of delectable treats, music, and engaging games create a festive ambiance. The annual cricket match of ABC Company not only promotes physical activity and healthy competition but also serves as a day of relaxation and enjoyment for employees and their families. It has become an integral part of the company',
          sportmainimgUrl: 'assets/Cricket.png',
        ),

        Sport(
          sporttitle: 'Annual Cricket Match',
          sportdescription: 'Inter department cricket match',
          sportimageUrl: 'assets/sports.png',
          sportcoinCount: 12,
          type: 'club',
          sportdetails:
              'The annual cricket match of ABC Company is a highly anticipated event that fosters a sense of unity and camaraderie among employees. From the moment the first ball is bowled, the atmosphere is electric, with players displaying their skills and spectators cheering on their favorite teams. The match serves as a platform for employees from different departments to come together, build relationships, and celebrate their shared passion for the sport. Beyond the cricketing action, the event offers a range of activities and entertainment for attendees. Food stalls with a variety of delectable treats, music, and engaging games create a festive ambiance. The annual cricket match of ABC Company not only promotes physical activity and healthy competition but also serves as a day of relaxation and enjoyment for employees and their families. It has become an integral part of the company',
          sportmainimgUrl: 'assets/Cricket.png',
        ),

        Sport(
          sporttitle: 'Annual Cricket Match',
          sportdescription: 'Inter department cricket match',
          sportimageUrl: 'assets/sports.png',
          sportcoinCount: 12,
          type: 'club',
          sportdetails:
              'The annual cricket match of ABC Company is a highly anticipated event that fosters a sense of unity and camaraderie among employees. From the moment the first ball is bowled, the atmosphere is electric, with players displaying their skills and spectators cheering on their favorite teams. The match serves as a platform for employees from different departments to come together, build relationships, and celebrate their shared passion for the sport. Beyond the cricketing action, the event offers a range of activities and entertainment for attendees. Food stalls with a variety of delectable treats, music, and engaging games create a festive ambiance. The annual cricket match of ABC Company not only promotes physical activity and healthy competition but also serves as a day of relaxation and enjoyment for employees and their families. It has become an integral part of the company',
          sportmainimgUrl: 'assets/Cricket.png',
        ),

        Sport(
          sporttitle: 'Annual Cricket Match',
          sportdescription: 'Inter department cricket match',
          sportimageUrl: 'assets/sports.png',
          sportcoinCount: 12,
          type: 'club',
          sportdetails:
              'The annual cricket match of ABC Company is a highly anticipated event that fosters a sense of unity and camaraderie among employees. From the moment the first ball is bowled, the atmosphere is electric, with players displaying their skills and spectators cheering on their favorite teams. The match serves as a platform for employees from different departments to come together, build relationships, and celebrate their shared passion for the sport. Beyond the cricketing action, the event offers a range of activities and entertainment for attendees. Food stalls with a variety of delectable treats, music, and engaging games create a festive ambiance. The annual cricket match of ABC Company not only promotes physical activity and healthy competition but also serves as a day of relaxation and enjoyment for employees and their families. It has become an integral part of the company',
          sportmainimgUrl: 'assets/Cricket.png',
        ),

        Sport(
          sporttitle: 'Annual Cricket Match',
          sportdescription: 'Inter department cricket match',
          sportimageUrl: 'assets/sports.png',
          sportcoinCount: 12,
          type: 'club',
          sportdetails:
              'The chess club at ABC Company offers employees a stimulating and intellectually engaging platform to indulge in their love for the game of chess. Open to players of all skill levels, the club provides a supportive and inclusive environment where employees can enhance their chess skills, learn new strategies, and engage in friendly matches with fellow colleagues. Joining the chess club not only allows employees to pursue their passion for chess but also fosters camaraderie and a sense of community within ABC Company.',
          sportmainimgUrl: 'assets/Cricket.png',
        ),

        // Add more activities as needed
      ];
      emit(SportsLoaded(sports));
    } catch (e) {
      emit(SportsError());
    }
  }
}
