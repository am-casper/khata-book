part of 'login_bloc.dart';


abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String phone;

  const LoginButtonPressed({
    required this.phone,
  });

  @override
  List<Object> get props => [phone];
}

class SignUpButtonPressed extends LoginEvent {
  final String phone;
  final String name;
  final double balance;

  const SignUpButtonPressed({
    required this.phone, required this.name, required this.balance
  });

  @override
  List<Object> get props => [phone, name, balance];
}