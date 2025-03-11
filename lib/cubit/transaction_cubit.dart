// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:food_market_app/cubit/cubit.dart';
import 'package:food_market_app/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:food_market_app/services/services.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransactions() async {
    // ignore: unused_local_variable
    ApiReturnValue<List<Transaction>> result =
        await TransactionServices.getTransactions();

    if (result.value != null) {
      emit(TransactionLoaded(result.value!));
    } else {
      emit(TransactionLoadingFailed(result.message!));
    }
  }

  Future<bool> submitTransaction(Transaction transaction) async {
    ApiReturnValue<Transaction> result =
        await TransactionServices.submitTransaction(transaction);

    if (result.value != null) {
      emit(TransactionLoaded(
          (state as TransactionLoaded).transactions + [result.value!]));
      return true;
    } else {
      return false;
    }
  }
}
