part of 'request_money_bloc.dart';

abstract class RequestMoneyEvent extends Equatable{
  const RequestMoneyEvent();

  @override
  List<Object> get props => [];
}

class RequestMoneyEventInitial extends RequestMoneyEvent {}

class RequestMoneyEventRequest extends RequestMoneyEvent {
  final double amount;
  final String senderPhone;

  const RequestMoneyEventRequest({
    required this.amount,
    required this.senderPhone,
  });

  @override
  List<Object> get props => [amount, senderPhone];
}