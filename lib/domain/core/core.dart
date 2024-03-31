import 'dart:collection';

import 'package:khata_book/data/core/core.dart';
import 'package:khata_book/domain/core/theme/theme.dart';
import 'package:khata_book/utils/booters/app_booter_bloc.dart';


abstract class AppCoreModule<T> implements Booter<T> {
  static final AppCoreModule instance = AppCoreModuleImpl();

  static final bootUpProcess = UnmodifiableListView(<AppCoreModule>[
    AppThemeBox.instance,
  ]);
}
