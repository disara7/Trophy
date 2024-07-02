import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int count;

  const CounterState(this.count);

  @override
  List<Object?> get props => [count];

  CounterState copyWith({int? count}) {
    return CounterState(count ?? this.count);
  }
}
