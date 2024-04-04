part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<TransactionList> transactions;
  final bool isCustomersTabActive;
  final bool loading;
  final bool error;
  final double creditBalance;
  final double debitBalance;

  const HomeState({
    required this.transactions,
    required this.isCustomersTabActive,
    required this.loading,
    required this.error,
    required this.creditBalance,
    required this.debitBalance,
  });

  HomeState.initial()
      : transactions = [],
        isCustomersTabActive = true,
        loading = true,
        error = false,
        creditBalance = 0,
        debitBalance = 0
        ;

  @override
  List<Object> get props => [];
}

class TransactionsFetched extends HomeState {
  const TransactionsFetched({required super.transactions, required super.isCustomersTabActive, required super.loading, required super.error, required super.creditBalance, required super.debitBalance});
}
