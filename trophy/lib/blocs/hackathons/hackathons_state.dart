import 'package:equatable/equatable.dart';
import 'hackathon.dart';

abstract class HackathonState extends Equatable {
  const HackathonState();

  @override
  List<Object?> get props => [];
}

class HackathonsInitial extends HackathonState {}

class HackathonsLoading extends HackathonState {}

class HackathonsLoaded extends HackathonState {
  final List<Hackathon> hackathons;

  const HackathonsLoaded(this.hackathons);

  @override
  List<Object?> get props => [hackathons];
}

class HackathonsLoadFailure extends HackathonState {
  final String error;

  const HackathonsLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
