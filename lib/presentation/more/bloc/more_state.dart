part of 'more_bloc.dart';

sealed class MoreState extends Equatable {
  const MoreState();
  
  @override
  List<Object> get props => [];
}

final class MoreInitial extends MoreState {}
