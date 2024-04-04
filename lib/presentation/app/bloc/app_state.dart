part of 'app_bloc.dart';

enum NavigateTo {
  inital,
  showHomeScreen,
}

class AppState {
  final NavigateTo navigateTo;

  AppState({required this.navigateTo});

  AppState copyWith({
    NavigateTo? navigateTo,
  }) {
    return AppState(
        navigateTo: navigateTo ?? this.navigateTo);
  }

  factory AppState.initial() => AppState(navigateTo: NavigateTo.inital);
}

class AppError extends AppState {
  final String errorMessage;

  AppError({required this.errorMessage}) : super(navigateTo: NavigateTo.inital);
}
