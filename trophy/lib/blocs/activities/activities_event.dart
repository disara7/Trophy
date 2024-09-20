import 'package:equatable/equatable.dart';

abstract class ActivitiesEvent extends Equatable {
  const ActivitiesEvent();

  @override
  List<Object?> get props => [];
}

class LoadActivities extends ActivitiesEvent {}
