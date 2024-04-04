import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khata_book/data/core/router/intrinsic_router.dart';
import 'package:khata_book/domain/repositories/transaction_repository.dart';
import 'package:khata_book/presentation/send_money/bloc/send_money_bloc.dart';

@RoutePage()
class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return BlocProvider(
        create: (context) => SendMoneyBloc(
            transactionRepository: context.read<TransactionRepository>()),
        child: BlocConsumer<SendMoneyBloc, SendMoneyState>(
          builder: (context, state) {
            if (state is SendMoneyLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SafeArea(
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('Send Money'),
                  ),
                  body: Column(
                    children: [
                      TextField(
                        controller: amountController,
                        decoration: const InputDecoration(
                          hintText: 'Enter amount',
                        ),
                      ),
                      TextField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          hintText: 'Enter phone number of receiver',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<SendMoneyBloc>().add(
                              SendMoneyRequestEvent(
                                  amount: double.parse(amountController.text),
                                  receiverPhone: phoneController.text));
                        },
                        child: const Text('Send Money'),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
          listener: (BuildContext context, SendMoneyState state) {
            if (state is SendMoneySuccessful) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Money requested successfully'),
                  backgroundColor: Colors.green,
                ),
              );
              context.router.pushAndPopUntil(const MoneyRoute(), predicate: ModalRoute.withName(MoneyRoute.name));
            } else if (state is SendMoneyError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Error requesting money'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ));
  }
}
