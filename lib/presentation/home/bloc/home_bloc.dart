import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchTransactions>(_onFetchTransactions);
  }

  FutureOr<void> _onFetchTransactions(
      FetchTransactions event, Emitter<HomeState> emit) {
    emit(HomeLoading());
    //Logic for fetching transactions
    emit(const TransactionsFetched(transactions: [
      {
        "name": "Sameer Sir Mentor A",
        "amount": 480,
        "date": "15/02/2024",
      },
      {
        "name": "Nishita",
        "amount": -180,
        "date": "14/01/2024",
      },
      {
        "name": "Mummy Ji",
        "amount": 100,
        "date": "25/12/2023",
      },
      {
        "name": "Chacha Ji",
        "amount": 450,
        "date": "15/12/2023",
      },
      {
        "name": "Aakash",
        "amount": 100,
        "date": "18/11/2023",
      },
      {
        "name": "Chai Tapri",
        "amount": -200,
        "date": "10/10/2023",
      },
      {
        "name": "Sameer Sir Mentor A",
        "amount": 480,
        "date": "15/02/2024",
      },
      {
        "name": "Nishita",
        "amount": -180,
        "date": "14/01/2024",
      },
      {
        "name": "Mummy Ji",
        "amount": 100,
        "date": "25/12/2023",
      },
      {
        "name": "Chacha Ji",
        "amount": 450,
        "date": "15/12/2023",
      },
      {
        "name": "Aakash",
        "amount": 100,
        "date": "18/11/2023",
      },
      {
        "name": "Chai Tapri",
        "amount": -200,
        "date": "10/10/2023",
      },
    ]));
  }
}
