import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:khata_book/data/services/local/local_storage_service.dart';
import 'package:khata_book/domain/models/transaction/new_transaction.dart';
import 'package:khata_book/domain/repositories/transaction_repository.dart';

part 'request_money_event.dart';
part 'request_money_state.dart';

class RequestMoneyBloc extends Bloc<RequestMoneyEvent, RequestMoneyState> {
  final TransactionRepository transactionRepository;
  RequestMoneyBloc({required this.transactionRepository})
      : super(RequestMoneyInitial()) {
    on<RequestMoneyEventRequest>(_onRequestMoney);
  }

  FutureOr<void> _onRequestMoney(
      RequestMoneyEventRequest event, Emitter<RequestMoneyState> emit) async {
    emit(RequestMoneyLoading());
    try {
      NewTransaction transaction = NewTransaction(
          transactionAmount: event.amount,
          debitUser: event.senderPhone,
          creditUser: LocalStorageService.getValue("phone"));
      await transactionRepository.addTransactions(transaction);
      emit(RequestMoneySuccessful());
    } catch (e) {
      emit(RequestMoneyError());
    }
  }
}
