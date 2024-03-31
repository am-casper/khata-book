import 'package:flutter/material.dart';
import 'package:khata_book/utils/app_extensions/app_extensions.dart';

part 'extension.dart';

abstract class DimensionalPolicies {
  DimensionalPolicies._();

  static double get policyRatioForWidth {
    const designWidth = 430.0;

    final deviceWidth = () {
      late double width;

      final context = BaseApp.currentContext;
      if (context != null) {
        width = MediaQuery.of(context).size.width;
      } else {
        width = designWidth;
      }

      return width;
    }();

    final widthScaleRatio = deviceWidth / designWidth;

    return widthScaleRatio;
  }

  static double get policyRatioForHeight {
    const designHeight = 932.0;

    final deviceHeight = () {
      late double height;
      late EdgeInsets padding;

      final context = BaseApp.currentContext;

      if (context != null) {
        padding = MediaQuery.of(context).padding;
        height = MediaQuery.of(context).size.height - padding.bottom;
      } else {
        height = designHeight;
      }

      return height;
    }();

    final heightScaleRatio = deviceHeight / designHeight;

    return heightScaleRatio;
  }
}
