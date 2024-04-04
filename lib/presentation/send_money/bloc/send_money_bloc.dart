import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:khata_book/data/services/local/local_storage_service.dart';
import 'package:khata_book/domain/models/transaction/new_transaction.dart';
import 'package:khata_book/domain/repositories/transaction_repository.dart';

part 'send_money_event.dart';
part 'send_money_state.dart';

class SendMoneyBloc extends Bloc<SendMoneyEvent, SendMoneyState> {
  final TransactionRepository transactionRepository;
  SendMoneyBloc({required this.transactionRepository})
      : super(SendMoneyInitial()) {
    on<SendMoneyRequestEvent>(_onSendMoney);
  }

  FutureOr<void> _onSendMoney(
      SendMoneyRequestEvent event, Emitter<SendMoneyState> emit) async {
    emit(SendMoneyLoading());
    try {
      NewTransaction transaction = NewTransaction(
          transactionAmount: event.amount,
          creditUser: event.receiverPhone,
          debitUser: LocalStorageService.getValue("phone"));
      await transactionRepository.addTransactions(transaction);
      emit(SendMoneySuccessful());
    } catch (e) {
      emit(SendMoneyError());
    }
  }
}
