import 'package:bloc/bloc.dart';
import 'package:khata_book/data/services/local/local_storage_service.dart';
import 'package:khata_book/domain/models/user/user.dart';
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
    String phone = "1234509876";
    try {
      User user = await userRepository.getCurrentUser(phone);
      LocalStorageService.setValue(key: 'phone', value: phone);
      LocalStorageService.setValue(key: 'name', value: user.name);
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
