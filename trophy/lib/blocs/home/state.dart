import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int coins;
  final int dailyChallenge;
  final int completedChallenges;
  final int level;

  const HomeState({
    required this.coins,
    required this.dailyChallenge,
    required this.completedChallenges,
    required this.level,
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