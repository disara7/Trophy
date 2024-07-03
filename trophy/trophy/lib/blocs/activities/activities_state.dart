import 'package:equatable/equatable.dart';

class Activity {
  final String title;
  final String description;
  final String imageUrl;
  final int coinCount;
  final String activitiesdetails;
  final String activitiesmainimgUrl;
  final String activitydate;
  final String activitytime;
  final String activityvenue;

  Activity({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.coinCount,
    required this.activitiesdetails,
    required this.activitiesmainimgUrl,
    required this.activitydate,
    required this.activitytime,
    required this.activityvenue,
  });
}

abstract class ActivitiesState extends Equatable {
  const ActivitiesState();

  @override
  List<Object> get props => [];
}

class ActivitiesInitial extends ActivitiesState {}

class ActivitiesLoading extends ActivitiesState {}

class ActivitiesLoaded extends ActivitiesState {
  final List<Activity> activities;

  const ActivitiesLoaded(this.activities);

  @override
  List<Object> get props => [activities];
}

class ActivitiesError extends ActivitiesState {}
