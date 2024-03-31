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
              initial: true,
              path: AppPathsRegistry.home,
              page: HomeRoute.page,
            ),
            CustomRoute(
              path: AppPathsRegistry.money,
              page: MoneyRoute.page,
            ),
            CustomRoute(
              path: AppPathsRegistry.more,
              page: MoreRoute.page,
            ),
          ],
        ),
      ],
    ),
  ];
}
