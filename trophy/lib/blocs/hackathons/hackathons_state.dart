import 'package:equatable/equatable.dart';

class Hackathon {
  final String hacktitle;
  final String hackdescription;
  final String hackimageUrl;
  final int hackcoinCount;
  final String hackathondetails;
  final String hackathonmainimgUrl;

  Hackathon({
    required this.hacktitle,
    required this.hackdescription,
    required this.hackimageUrl,
    required this.hackcoinCount,
    required this.hackathondetails,
    required this.hackathonmainimgUrl,
  });
}

abstract class HackathonState extends Equatable {
  const HackathonState();

  @override
  List<Object> get props => [];
}

class HackathonsInitial extends HackathonState {}

class HackathonsLoading extends HackathonState {}

class HackathonsLoaded extends HackathonState {
  final List<Hackathon> hackathons;

  const HackathonsLoaded(this.hackathons);

  @override
  List<Object> get props => [hackathons];
}

class HackathonsError extends HackathonState {}
