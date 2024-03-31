import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'money_event.dart';
part 'money_state.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  MoneyBloc() : super(MoneyInitial()) {
    on<FetchMoney>(_onFetchMoney);
  }

  void _onFetchMoney(FetchMoney event, Emitter<MoneyState> emit) {
    emit(MoneyLoading());
    //Logic for fetching money
    emit(MoneyFetched(money: "5,520"));
  }
}
