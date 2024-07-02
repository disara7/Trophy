import 'package:flutter_bloc/flutter_bloc.dart';
import 'event.dart';
import 'fetchdata.dart';
import 'state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<LoadHomeData>((event, emit) async {
      try {
        final homeState = await fetchHomeState();
        emit(homeState);
      } catch (e) {
        print('Failed to load home data: $e');
      }
    });

    on<UpdateCoins>((event, emit) {
      emit(state.copyWith(coins: event.coins));
    });

    on<UpdateDailyChallenge>((event, emit) {
      emit(state.copyWith(dailyChallenge: event.dailyChallenge));
    });

    on<UpdateCompletedChallenges>((event, emit) {
      emit(state.copyWith(completedChallenges: event.completedChallenges));
    });

    on<UpdateLevel>((event, emit) {
      emit(state.copyWith(level: event.level));
    });
  }
}
