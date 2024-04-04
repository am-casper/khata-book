import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:khata_book/domain/models/user/user.dart';
import 'package:khata_book/domain/repositories/user_repository.dart';
import 'package:intl/intl.dart';


part 'money_event.dart';
part 'money_state.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  final UserRepository userRepository;
  MoneyBloc({required this.userRepository}) : super(MoneyInitial()) {
    on<FetchMoney>(_onFetchMoney);
  }

  void _onFetchMoney(FetchMoney event, Emitter<MoneyState> emit) async {
    emit(MoneyLoading());
    try {
      User user = await userRepository.getCurrentUser("1234509876");
      double balance = user.balance;
      var formatter = NumberFormat.decimalPattern('en_IN');
      String formatted = formatter.format(balance);
      emit(MoneyFetched(name: user.name, balance: formatted));
    } catch (e) {
      emit(MoneyFetchFailed());
    }
  }
}
