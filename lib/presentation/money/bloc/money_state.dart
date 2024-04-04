part of 'money_bloc.dart';

abstract class MoneyState extends Equatable {
  const MoneyState();
  
  @override
  List<Object> get props => [];
}

class MoneyInitial extends MoneyState {}

class MoneyLoading extends MoneyState {}

class MoneyFetched extends MoneyState{
  final String name;
  final String balance;

  const MoneyFetched({required this.name, required this.balance});

  @override
  List<Object> get props => [name, balance];
}

class MoneyFetchFailed extends MoneyState{}
