import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:khata_book/domain/models/transaction/transaction_list.dart';
import 'package:khata_book/domain/repositories/transaction_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TransactionRepository transactionRepository;
  HomeBloc({required this.transactionRepository}) : super(HomeState.initial()) {
    on<FetchTransactions>(_onFetchTransactions);
    on<TabSwitched>(_onTabSwitched);
  }

  FutureOr<void> _onFetchTransactions(
      FetchTransactions event, Emitter<HomeState> emit) async {
    emit(HomeState.initial());
    //Logic for fetching transactions
    try {
      List<TransactionList> transactions =
          await transactionRepository.getTransactions('1234509876');
      double cr = 0;
      double dr = 0;
      for (var transaction in transactions) {
        if (transaction.transactionAmount > 0) {
          cr += transaction.transactionAmount;
        } else {
          dr += transaction.transactionAmount;
        }
      }
      emit(TransactionsFetched(
          transactions: transactions,
          isCustomersTabActive: state.isCustomersTabActive,
          loading: false,
          error: false,
          creditBalance: cr,
          debitBalance: dr));
    } catch (e) {
      print(e.toString());
      emit(TransactionsFetched(
          transactions: state.transactions,
          isCustomersTabActive: state.isCustomersTabActive,
          loading: false,
          error: true,
          creditBalance: state.creditBalance,
          debitBalance: state.debitBalance));
    }
  }

  void _onTabSwitched(TabSwitched event, Emitter<HomeState> emit) {
    emit(HomeState(
        transactions: state.transactions,
        isCustomersTabActive: state.isCustomersTabActive,
        loading: state.loading,
        error: state.error,
        creditBalance: state.creditBalance,
        debitBalance: state.debitBalance));
    emit(TransactionsFetched(
        transactions: state.transactions,
        isCustomersTabActive: event.isCustomersTabActive,
        loading: false,
        error: state.error,
        creditBalance: state.creditBalance,
        debitBalance: state.debitBalance));
  }
}
