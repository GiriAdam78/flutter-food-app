part of 'transaction_cubit.dart';

abstract class TransactionState {
  const TransactionState();

  @override
  // ignore: override_on_non_overriding_member
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<Transaction> transactions;

  TransactionLoaded(this.transactions);

  @override
  List<Object> get props => [transactions];
}

class TransactionLoadingFailed extends TransactionState {
  final String message;

  TransactionLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
