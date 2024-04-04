part of 'send_money_bloc.dart';

abstract class SendMoneyEvent extends Equatable {
  const SendMoneyEvent();

  @override
  List<Object> get props => [];
}

class SendMoneyEventInitial extends SendMoneyEvent {}

class SendMoneyRequestEvent extends SendMoneyEvent {
  final double amount;
  final String receiverPhone;

  const SendMoneyRequestEvent({
    required this.amount,
    required this.receiverPhone,
  });

  @override
  List<Object> get props => [amount, receiverPhone];
}
