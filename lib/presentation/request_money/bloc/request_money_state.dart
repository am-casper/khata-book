part of 'request_money_bloc.dart';

abstract class RequestMoneyState extends Equatable {
  const RequestMoneyState();

  @override
  List<Object> get props => [];
}

class RequestMoneyInitial extends RequestMoneyState {}

class RequestMoneyLoading extends RequestMoneyState {}

class RequestMoneySuccessful extends RequestMoneyState {}

class RequestMoneyError extends RequestMoneyState {}
