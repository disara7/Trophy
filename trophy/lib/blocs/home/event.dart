import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadHomeData extends HomeEvent {}

class UpdateCoins extends HomeEvent {
  final int coins;

  const UpdateCoins(this.coins);

  @override
  List<Object> get props => [coins];
}

class UpdateDailyChallenge extends HomeEvent {
  final int dailyChallenge;

  const UpdateDailyChallenge(this.dailyChallenge);

  @override
  List<Object> get props => [dailyChallenge];
}

class UpdateCompletedChallenges extends HomeEvent {
  final int completedChallenges;

  const UpdateCompletedChallenges(this.completedChallenges);

  @override
  List<Object> get props => [completedChallenges];
}

class UpdateLevel extends HomeEvent {
  final int level;

  const UpdateLevel(this.level);

  @override
  List<Object> get props => [level];
}
