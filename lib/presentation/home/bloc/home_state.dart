part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class TransactionsFetched extends HomeState {
  final List<Map<String,dynamic>> transactions;

  const TransactionsFetched({required this.transactions});

  @override
  List<Object> get props => [transactions];
}
