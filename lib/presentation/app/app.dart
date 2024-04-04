import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khata_book/data/core/router/intrinsic_router.gr.dart';
import 'package:khata_book/data/services/remote/api_service.dart';
import 'package:khata_book/domain/repositories/transaction_repository.dart';
import 'package:khata_book/domain/repositories/user_repository.dart';
import 'package:khata_book/presentation/app/bloc/app_bloc.dart';
import 'package:khata_book/utils/app_extensions/app_extensions.dart';

class KhataBookApp extends StatefulWidget {
  const KhataBookApp({super.key});
  @override
  State<KhataBookApp> createState() => _KhataBookAppState();
}

class _KhataBookAppState extends State<KhataBookApp> {
  late final ApiService apiService;

  @override
  void initState() {
    apiService = _getApiService();
    super.initState();
  }

  ApiService _getApiService() {
    return ApiService(
      Dio(
        BaseOptions(
          headers: {'Content-Type': 'application/json'},
        ),
      )
    );
  }

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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(apiService),
        ),
        RepositoryProvider<TransactionRepository>(
          create: (context) => TransactionRepository(apiService),
        ),
      ],
      child: BlocProvider(
        create: (context) => AppBloc(userRepository: context.read<UserRepository>())..add(const Initialize()),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (BuildContext context, AppState state) {
            return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: "Khata Book",
                routerDelegate: _getDelegate(state),
                routeInformationParser: BaseApp.router.defaultRouteParser(),
                // TODO: add theme
              );
          },
        ),
      ),
    );
  }
}
