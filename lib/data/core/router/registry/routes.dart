part of '../../router.dart';

class AppRoutesRegistry {
  AppRoutesRegistry._();

  static List<AutoRoute> routes = <AutoRoute>[
    CustomRoute(
      path: AppPathsRegistry.homeWrapper,
      page: HomeWrapper.page,
      children: [
        CustomRoute(
          initial: true,
          path: AppPathsRegistry.bottomNav,
          page: BottomNavBar.page,
          children: [
            CustomRoute(
              path: AppPathsRegistry.home,
              page: HomeRoute.page,
            ),
            CustomRoute(
              initial: true,
              path: AppPathsRegistry.money,
              page: MoneyRoute.page,
            ),
            CustomRoute(
              path: AppPathsRegistry.more,
              page: MoreRoute.page,
            ),
          ],
        ),
        CustomRoute(
          path: AppPathsRegistry.requestMoney,
          page: RequestMoneyRoute.page,
        ),
        CustomRoute(
          path: AppPathsRegistry.sendMoney,
          page: SendMoneyRoute.page,
        ),
      ],
    ),
    CustomRoute(
      path: AppPathsRegistry.authWrapper,
      page: AuthWrapper.page,
      children: [
        CustomRoute(
          initial: true,
          path: AppPathsRegistry.login,
          page: LoginRoute.page,
        ),
      ],
    ),
  ];
}
