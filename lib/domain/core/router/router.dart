import 'package:khata_book/data/core/router.dart';
import 'package:khata_book/domain/core/core.dart';

abstract class AppRouter<I> implements AppCoreModule<void> {
  static final AppRouterImpl instance = AppRouterImpl();

  void navigateToPage(I router);
}
