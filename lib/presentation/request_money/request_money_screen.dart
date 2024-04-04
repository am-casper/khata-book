import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khata_book/data/core/router/intrinsic_router.gr.dart';
import 'package:khata_book/domain/repositories/transaction_repository.dart';
import 'package:khata_book/presentation/request_money/bloc/request_money_bloc.dart';

@RoutePage()
class RequestMoneyScreen extends StatelessWidget {
  const RequestMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return BlocProvider(
        create: (context) => RequestMoneyBloc(
            transactionRepository: context.read<TransactionRepository>()),
        child: BlocConsumer<RequestMoneyBloc, RequestMoneyState>(
          builder: (context, state) {
            if (state is RequestMoneyLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SafeArea(
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('Request Money'),
                  ),
                  body: Column(
                    children: [
                      TextField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          hintText: 'Enter phone number of sender',
                        ),
                      ),
                      TextField(
                        controller: amountController,
                        decoration: const InputDecoration(
                          hintText: 'Enter amount',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<RequestMoneyBloc>().add(
                              RequestMoneyEventRequest(
                                  amount: double.parse(amountController.text),
                                  senderPhone: phoneController.text));
                        },
                        child: const Text('Request Money'),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
          listener: (BuildContext context, RequestMoneyState state) {
            if (state is RequestMoneySuccessful) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Money requested successfully'),
                  backgroundColor: Colors.green,
                ),
              );
              context.router.pushAndPopUntil(const MoneyRoute(), predicate: ModalRoute.withName(MoneyRoute.name));
            } else if (state is RequestMoneyError) {
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
