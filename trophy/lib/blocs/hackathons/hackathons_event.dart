import 'package:equatable/equatable.dart';

abstract class HackathonsEvent extends Equatable {
  const HackathonsEvent();

  @override
  List<Object> get props => [];
}

class LoadHackathons extends HackathonsEvent {}
