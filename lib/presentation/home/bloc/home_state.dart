part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<Map<String, dynamic>> transactions;
  final bool isCustomersTabActive;
  final bool loading;
  final bool error;

  const HomeState({
    required this.transactions,
    required this.isCustomersTabActive,
    required this.loading,
    required this.error,
  });

  HomeState.initial()
      : transactions = [],
        isCustomersTabActive = true,
        loading = true,
        error = false;

  @override
  List<Object> get props => [];
}

class TransactionsFetched extends HomeState{
  const TransactionsFetched({required super.transactions, required super.isCustomersTabActive, required super.loading, required super.error});

}