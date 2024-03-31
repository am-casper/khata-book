import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khata_book/data/core/router/intrinsic_router.gr.dart';
import 'package:khata_book/presentation/app/bloc/app_bloc.dart';
import 'package:khata_book/utils/app_extensions/app_extensions.dart';

class KhataBookApp extends StatefulWidget {
  const KhataBookApp({super.key});
  @override
  State<KhataBookApp> createState() => _KhataBookAppState();
}

class _KhataBookAppState extends State<KhataBookApp> {

  RouterDelegate<Object> _getDelegate(AppState state) {
    return AutoRouterDelegate.declarative(BaseApp.router, routes: (_) {
      switch (state.navigateTo) {
        case NavigateTo.showHomeScreen:
          return [const HomeWrapper()];
        default:
          return [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc()..add(const Initialize()),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (BuildContext context, AppState state) {
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: "Appetizer",
              routerDelegate: _getDelegate(state),
              routeInformationParser: BaseApp.router.defaultRouteParser(),
              // TODO: add theme
            );
        },
      ),
    );
  }
}
