import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0));

  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementCounter) {
      yield state.copyWith(count: state.count + 1);
    } else if (event is DecrementCounter) {
      yield state.copyWith(count: state.count - 1);
    }
  }
}
