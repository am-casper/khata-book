import 'package:flutter/material.dart';
import 'package:khata_book/data/core/theme/theme.dart';
import 'package:khata_book/domain/core/core.dart';

part 'policies/colors.dart';

abstract class AppThemeBox implements AppCoreModule<void> {
  static final AppThemeBox instance = AppThemeBoxImpl();

  AppThemeColors get colors;
}