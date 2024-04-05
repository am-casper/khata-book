import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khata_book/presentation/app/bloc/app_bloc.dart';

@RoutePage()
class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Center(
            child: TextButton(
          onPressed: () {
            context.read<AppBloc>().add(const Logout());
          },
          child: const Text("Logout"),
        ));
      },
    );
  }
}
