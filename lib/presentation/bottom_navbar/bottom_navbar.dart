import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khata_book/data/core/router/intrinsic_router.dart';
import 'package:khata_book/data/core/router/intrinsic_router.gr.dart';
import 'package:khata_book/domain/repositories/transaction_repository.dart';
import 'package:khata_book/domain/repositories/user_repository.dart';
import 'package:khata_book/presentation/home/bloc/home_bloc.dart';
import 'package:khata_book/presentation/money/bloc/money_bloc.dart';
import 'package:khata_book/presentation/more/bloc/more_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class HomeWrapper extends StatelessWidget {
  const HomeWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage()
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(transactionRepository: context.read<TransactionRepository>())..add(FetchTransactions()),
        ),
        BlocProvider(
          create: (context) => MoneyBloc(userRepository: context.read<UserRepository>())..add(FetchMoney()),
        ),
        BlocProvider(
          create: (context) => MoreBloc(),
        ),
      ],
      child: AutoTabsRouter(
        routes: const [
          HomeRoute(),
          MoneyRoute(),
          MoreRoute(),
        ],
        builder: (context, child) {
          final tabRouter = AutoTabsRouter.of(context);

          return Scaffold(
            backgroundColor: Colors.white,
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              key: UniqueKey(),
              currentIndex: tabRouter.activeIndex,
              onTap: (index) {
                tabRouter.setActiveIndex(index);
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedFontSize: 0,
              items: [
                BottomNavigationBarItem(
                  tooltip: 'Home',
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 0, top:3.5),
                    
                    child:
                        SvgPicture.asset('assets/icons/bottom_navbar/home.svg'),
                  ),
                  activeIcon: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: SvgPicture.asset(
                        'assets/icons/bottom_navbar/home_selected.svg'),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 0, top:3.5),
                    child: SvgPicture.asset(
                        'assets/icons/bottom_navbar/money.svg'),
                  ),
                  activeIcon: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: SvgPicture.asset(
                        'assets/icons/bottom_navbar/money_selected.svg'),
                  ),
                  label: 'Money',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: SvgPicture.asset(
                          'assets/icons/bottom_navbar/more.svg',)),
                  activeIcon: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: SvgPicture.asset(
                          'assets/icons/bottom_navbar/more.svg')),
                  label: 'More',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
