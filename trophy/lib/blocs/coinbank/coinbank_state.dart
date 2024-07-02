import 'package:equatable/equatable.dart';

abstract class CoinBankState extends Equatable {
  const CoinBankState();

  @override
  List<Object> get props => [];
}

class CoinBankInitial extends CoinBankState {
  const CoinBankInitial();

  @override
  List<Object> get props => [];
}

class CoinBankLoading extends CoinBankState {
  const CoinBankLoading();

  @override
  List<Object> get props => [];
}

class CoinBankLoaded extends CoinBankState {
  final int count;

  const CoinBankLoaded(this.count);

  @override
  List<Object> get props => [count];
}

class CoinBankError extends CoinBankState {
  final String message;

  const CoinBankError(this.message);

  @override
  List<Object> get props => [message];
}
