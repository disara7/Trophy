import 'package:equatable/equatable.dart';
import 'sport.dart';

abstract class SportsState extends Equatable {
  const SportsState();

  @override
  List<Object?> get props => [];
}

class SportsInitial extends SportsState {}

class SportsLoading extends SportsState {}

class SportsLoaded extends SportsState {
  final List<Sport> sports;

  const SportsLoaded(this.sports);

  @override
  List<Object?> get props => [sports];
}

class SportsLoadFailure extends SportsState {
  final String error;

  const SportsLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
