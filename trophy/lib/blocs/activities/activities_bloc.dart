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
            activitiesdetails:
                'The annual cricket match of ABC Company is a highly anticipated event that fosters a sense of unity and camaraderie among employees. From the moment the first ball is bowled, the atmosphere is electric, with players displaying their skills and spectators cheering on their favorite teams. The match serves as a platform for employees from different departments to come together, build relationships, and celebrate their shared passion for the sport. Beyond the cricketing action, the event offers a range of activities and entertainment for attendees. Food stalls with a variety of delectable treats, music, and engaging games create a festive ambiance. The annual cricket match of ABC Company not only promotes physical activity and healthy competition but also serves as a day of relaxation and enjoyment for employees and their families. It has become an integral part of the company',
            activitiesmainimgUrl: 'assets/Cricket.png',
            activitydate: '06.08.20024',
            activitytime: '2.00 PM onwards',
            activityvenue: 'IFS main office'),
        Activity(
            title: 'EmploInpire',
            description: 'Soft skills development workshop',
            imageUrl:
                'assets/soft-skills.png', // Replace with correct imageUrl path
            coinCount: 20,
            activitiesdetails:
                'The annual cricket match of ABC Company is a highly anticipated event that fosters a sense of unity and camaraderie among employees. From the moment the first ball is bowled, the atmosphere is electric, with players displaying their skills and spectators cheering on their favorite teams. The match serves as a platform for employees from different departments to come together, build relationships, and celebrate their shared passion for the sport. Beyond the cricketing action, the event offers a range of activities and entertainment for attendees. Food stalls with a variety of delectable treats, music, and engaging games create a festive ambiance. The annual cricket match of ABC Company not only promotes physical activity and healthy competition but also serves as a day of relaxation and enjoyment for employees and their families. It has become an integral part of the company',
            activitiesmainimgUrl: 'assets/Cricket.png',
            activitydate: '06.08.20024',
            activitytime: '2.00 PM onwards',
            activityvenue: 'IFS main office'),
        Activity(
            title: 'EmploInpire',
            description: 'Soft skills development workshop',
            imageUrl:
                'assets/soft-skills.png', // Replace with correct imageUrl path
            coinCount: 20,
            activitiesdetails:
                'The annual cricket match of ABC Company is a highly anticipated event that fosters a sense of unity and camaraderie among employees. From the moment the first ball is bowled, the atmosphere is electric, with players displaying their skills and spectators cheering on their favorite teams. The match serves as a platform for employees from different departments to come together, build relationships, and celebrate their shared passion for the sport. Beyond the cricketing action, the event offers a range of activities and entertainment for attendees. Food stalls with a variety of delectable treats, music, and engaging games create a festive ambiance. The annual cricket match of ABC Company not only promotes physical activity and healthy competition but also serves as a day of relaxation and enjoyment for employees and their families. It has become an integral part of the company',
            activitiesmainimgUrl: 'assets/Cricket.png',
            activitydate: '06.08.20024',
            activitytime: '2.00 PM onwards',
            activityvenue: 'IFS main office'),
        Activity(
            title: 'EmploInpire',
            description: 'Soft skills development workshop',
            imageUrl:
                'assets/soft-skills.png', // Replace with correct imageUrl path
            coinCount: 20,
            activitiesdetails:
                'The annual cricket match of ABC Company is a highly anticipated event that fosters a sense of unity and camaraderie among employees. From the moment the first ball is bowled, the atmosphere is electric, with players displaying their skills and spectators cheering on their favorite teams. The match serves as a platform for employees from different departments to come together, build relationships, and celebrate their shared passion for the sport. Beyond the cricketing action, the event offers a range of activities and entertainment for attendees. Food stalls with a variety of delectable treats, music, and engaging games create a festive ambiance. The annual cricket match of ABC Company not only promotes physical activity and healthy competition but also serves as a day of relaxation and enjoyment for employees and their families. It has become an integral part of the company',
            activitiesmainimgUrl: 'assets/Cricket.png',
            activitydate: '01.08.20024',
            activitytime: '3.00 PM onwards',
            activityvenue: 'Ayowa'),
        Activity(
            title: 'EmploInpire',
            description: 'Soft skills development workshop',
            imageUrl:
                'assets/soft-skills.png', // Replace with correct imageUrl path
            coinCount: 20,
            activitiesdetails:
                'The annual cricket match of ABC Company is a highly anticipated event that fosters a sense of unity and camaraderie among employees. From the moment the first ball is bowled, the atmosphere is electric, with players displaying their skills and spectators cheering on their favorite teams. The match serves as a platform for employees from different departments to come together, build relationships, and celebrate their shared passion for the sport. Beyond the cricketing action, the event offers a range of activities and entertainment for attendees. Food stalls with a variety of delectable treats, music, and engaging games create a festive ambiance. The annual cricket match of ABC Company not only promotes physical activity and healthy competition but also serves as a day of relaxation and enjoyment for employees and their families. It has become an integral part of the company',
            activitiesmainimgUrl: 'assets/Cricket.png',
            activitydate: '06.08.20024',
            activitytime: '2.00 PM onwards',
            activityvenue: 'IFS main office'),
        Activity(
            title: 'EmploInpire',
            description: 'Soft skills development workshop',
            imageUrl:
                'assets/soft-skills.png', // Replace with correct imageUrl path
            coinCount: 20,
            activitiesdetails:
                'The annual cricket match of ABC Company is a highly anticipated event that fosters a sense of unity and camaraderie among employees. From the moment the first ball is bowled, the atmosphere is electric, with players displaying their skills and spectators cheering on their favorite teams. The match serves as a platform for employees from different departments to come together, build relationships, and celebrate their shared passion for the sport. Beyond the cricketing action, the event offers a range of activities and entertainment for attendees. Food stalls with a variety of delectable treats, music, and engaging games create a festive ambiance. The annual cricket match of ABC Company not only promotes physical activity and healthy competition but also serves as a day of relaxation and enjoyment for employees and their families. It has become an integral part of the company',
            activitiesmainimgUrl: 'assets/Cricket.png',
            activitydate: '06.08.20024',
            activitytime: '2.00 PM onwards',
            activityvenue: 'IFS main office'),

        // Add more activities as needed
      ];
      emit(ActivitiesLoaded(activities));
    } catch (e) {
      emit(ActivitiesError());
    }
  }
}
