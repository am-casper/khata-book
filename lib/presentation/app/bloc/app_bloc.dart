import 'package:bloc/bloc.dart';
import 'package:khata_book/data/services/local/local_storage_service.dart';
import 'package:khata_book/domain/repositories/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final UserRepository userRepository;
  AppBloc({required this.userRepository}) : super(AppState.initial()) {
    on<Initialize>(_onInitialize);
    on<NavigateToHomeScreen>(_onNavigateToHomeScreen);
  }

  void _onInitialize(Initialize event, Emitter<AppState> emit) async {
    //Write logic for Authentication
    final phone = LocalStorageService.getValue('phone');
    if (phone == null) {
      emit(state.copyWith(navigateTo: NavigateTo.showLoginScreen));
      return;
    }
    try {
      add(const NavigateToHomeScreen());
    } catch (e) {
      emit(AppError(errorMessage: e.toString()));
    }
  }

  void _onNavigateToHomeScreen(
      NavigateToHomeScreen event, Emitter<AppState> emit) {
    emit(state.copyWith(navigateTo: NavigateTo.showHomeScreen));
  }
}
