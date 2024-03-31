import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:khata_book/data/core/router/intrinsic_router.gr.dart';
import 'package:khata_book/domain/core/router/router.dart';

part 'router/registry/paths.dart';
part 'router/registry/routes.dart';

class AppRouterImpl extends $IntrinsicRouter
    implements AppRouter<PageRouteInfo<dynamic>> {
  AppRouterImpl() : super();

  @override
  void navigateToPage(PageRouteInfo<dynamic> route) {}

  @override
  List<AutoRoute> routes = AppRoutesRegistry.routes;

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  void bootDown() {
    log('[AppRouter.bootDown]');
  }

  @override
  Future<void> bootUp() async {
    log('[AppRouter.bootUp]');
  }

  @override
  void onBootUp() {
    log('[AppRouter.onBootUp]');
  }
}
