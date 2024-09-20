import 'package:equatable/equatable.dart';
import 'activity.dart';

abstract class ActivitiesState extends Equatable {
  const ActivitiesState();

  @override
  List<Object?> get props => [];
}

class ActivitiesInitial extends ActivitiesState {}

class ActivitiesLoading extends ActivitiesState {}

class ActivitiesLoaded extends ActivitiesState {
  final List<Activity> activities;

  const ActivitiesLoaded(this.activities);

  @override
  List<Object?> get props => [activities];
}

class ActivitiesLoadFailure extends ActivitiesState {
  final String error;

  const ActivitiesLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
