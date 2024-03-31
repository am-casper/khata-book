part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class Initialize extends AppEvent {
  const Initialize();
}

class NavigateToHomeScreen extends AppEvent {
  const NavigateToHomeScreen();
}

