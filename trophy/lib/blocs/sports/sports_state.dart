import 'package:equatable/equatable.dart';

class Sport {
  final String sporttitle;
  final String sportdescription;
  final String sportimageUrl;
  final int sportcoinCount;

  Sport({
    required this.sporttitle,
    required this.sportdescription,
    required this.sportimageUrl,
    required this.sportcoinCount,
  });
}

abstract class SportsState extends Equatable {
  const SportsState();

  @override
  List<Object> get props => [];
}

class SportsInitial extends SportsState {}

class SportsLoading extends SportsState {}

class SportsLoaded extends SportsState {
  final List<Sport> sports;

  const SportsLoaded(this.sports);

  @override
  List<Object> get props => [sports];
}

class SportsError extends SportsState {}
