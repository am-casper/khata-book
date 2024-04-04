import 'package:flutter/foundation.dart';
import 'package:khata_book/data/constants/constants.dart';
import 'package:khata_book/data/services/remote/api_service.dart';
import 'package:khata_book/domain/models/failure_model.dart';
import 'package:khata_book/domain/models/transaction/new_transaction.dart';
import 'package:khata_book/domain/models/transaction/transaction_list.dart';

class TransactionRepository {
  final ApiService _apiService;

  TransactionRepository(this._apiService);
  
  Future<void> addTransactions(NewTransaction newTransaction) async {
    try {
      await _apiService.addTransaction(newTransaction);
    } catch (e) {
      debugPrint(e.toString());
      throw Failure(AppConstants.GENERIC_FAILURE);
    }
  }

  Future<List<TransactionList>> getTransactions(String phone) async {
    try {
      return await _apiService.getTransactions(phone);
    } catch (e) {
      debugPrint(e.toString());
      throw Failure(AppConstants.GENERIC_FAILURE);
    }
  }
}
