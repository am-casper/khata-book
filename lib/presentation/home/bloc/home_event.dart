part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchTransactions extends HomeEvent {}

class TabSwitched extends HomeEvent {
  final bool isCustomersTabActive;

  const TabSwitched({required this.isCustomersTabActive});
}
