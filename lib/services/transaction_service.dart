part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions() async {
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(seconds: 3));
    return ApiReturnValue(value: mockTransactions);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction) async {
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(seconds: 2));

    // return ApiReturnValue(message: "Transaksi Gagal");
    return ApiReturnValue(
        value:
            transaction.copyWith(id: 123, status: TransactionStatus.pending));
  }
}
