import 'package:flutter_bloc/flutter_bloc.dart';

// Define events for the BLoC
enum CoinBankEvent { increment, decrement }

class CoinBankBloc extends Bloc<CoinBankEvent, int> {
  CoinBankBloc() : super(0); // Initial state is 0

  Stream<int> mapEventToState(CoinBankEvent event) async* {
    switch (event) {
      case CoinBankEvent.increment:
        yield state + 1; // Increment state by 1
        break;
      case CoinBankEvent.decrement:
        yield state - 1; // Decrement state by 1
        break;
    }
  }
}
