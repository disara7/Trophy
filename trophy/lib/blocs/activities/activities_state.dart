import 'package:equatable/equatable.dart';

class Activity {
  final String title;
  final String description;
  final String imageUrl;
  final int coinCount;

  Activity({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.coinCount,
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
