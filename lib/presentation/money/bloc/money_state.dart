part of 'money_bloc.dart';

abstract class MoneyState extends Equatable {
  const MoneyState();
  
  @override
  List<Object> get props => [];
}

class MoneyInitial extends MoneyState {}

class MoneyLoading extends MoneyState {}

class MoneyFetched extends MoneyState{
  final String money;

  const MoneyFetched({required this.money});

  @override
  List<Object> get props => [money];
}

class MoneyFetchFailed extends MoneyState{}
