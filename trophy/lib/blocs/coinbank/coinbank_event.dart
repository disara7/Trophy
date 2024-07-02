abstract class CoinBankEvent {}

class IncrementEvent extends CoinBankEvent {}

class DecrementEvent extends CoinBankEvent {
  final int amount;

  DecrementEvent({required this.amount}) : assert(amount >= 0);
}

class ResetEvent extends CoinBankEvent {}
