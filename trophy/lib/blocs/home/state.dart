import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int coins;
  final int dailyChallenge;
  final int completedChallenges;
  final int level;

  const HomeState({
    this.coins = 0,
    this.dailyChallenge = 10,
    this.completedChallenges = 0,
    this.level = 1,
  });

  HomeState copyWith({
    int? coins,
    int? dailyChallenge,
    int? completedChallenges,
    int? level,
  }) {
    return HomeState(
      coins: coins ?? this.coins,
      dailyChallenge: dailyChallenge ?? this.dailyChallenge,
      completedChallenges: completedChallenges ?? this.completedChallenges,
      level: level ?? this.level,
    );
  }

  @override
  List<Object?> get props => [coins, dailyChallenge, completedChallenges, level];
}
