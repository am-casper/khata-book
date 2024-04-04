import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:khata_book/data/services/local/local_storage_service.dart';
import 'package:khata_book/domain/models/user/user.dart';
import 'package:khata_book/domain/repositories/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  LoginBloc({required this.userRepository}) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<SignUpButtonPressed>(_onSignUpButtonPressed);
  }

  FutureOr<void> _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    try {
      User user = await userRepository.getCurrentUser(event.phone);
      if (user.phone.isEmpty) {
        emit(SignUpScreenActive());
      } else {
        LocalStorageService.setValue(key: 'phone', value: user.phone);
        LocalStorageService.setValue(key: 'name', value: user.name);
        emit(LoginSuccess());
      }
    } catch (e) {
      emit(LoginFailure());
    }
  }

  Future<FutureOr<void>> _onSignUpButtonPressed(
      SignUpButtonPressed event, Emitter<LoginState> emit) async {
    try {
      User user =
          User(phone: event.phone, name: event.name, balance: event.balance);
      await userRepository.signUpUser(user);
      LocalStorageService.setValue(key: 'phone', value: user.phone);
      LocalStorageService.setValue(key: 'name', value: user.name);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure());
    }
  }
}
