import 'package:flutter/material.dart';
import 'package:khata_book/data/core/router.dart';
import 'package:khata_book/domain/core/router/router.dart';
import 'package:khata_book/domain/core/theme/theme.dart';

class BaseApp {
  BaseApp._();

  static final AppRouterImpl router = AppRouter.instance;
  static BuildContext? get currentContext => router.navigatorKey.currentContext;
  static final theme = AppThemeBox.instance;
}
