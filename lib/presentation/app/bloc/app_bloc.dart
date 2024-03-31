import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial()) {
    on<Initialize>(_onInitialize);
    on<NavigateToHomeScreen>(_onNavigateToHomeScreen);
  }

  void _onInitialize(Initialize event, Emitter<AppState> emit) {
    //Write logic for Authentication
    add(const NavigateToHomeScreen());
  }

  void _onNavigateToHomeScreen(
      NavigateToHomeScreen event, Emitter<AppState> emit) {
        emit(state.copyWith(navigateTo: NavigateTo.showHomeScreen));
      }
}
