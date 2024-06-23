import 'package:digital_manual/core/adaptive/adaptive.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  final BuildContext context;
  AppTextStyle(this.context);

  TextTheme get textTheme => Theme.of(context).textTheme;

  TextStyle? generateAdaptiveStyle(
    TextStyle? smallStyle,
    TextStyle? mediumStyle,
    TextStyle? largeStyle,
  ) =>
      Adaptive(context).isScreenSmall
          ? smallStyle
          : Adaptive(context).isScreenMedium
              ? mediumStyle
              : largeStyle;

  TextStyle? get appLableStyle => generateAdaptiveStyle(
      textTheme.labelSmall, textTheme.labelMedium, textTheme.labelLarge);

  TextStyle? get appHeadStyle => generateAdaptiveStyle(textTheme.headlineSmall,
      textTheme.headlineMedium, textTheme.headlineLarge);

  TextStyle? get appTitleStyle => generateAdaptiveStyle(
      textTheme.titleSmall, textTheme.titleMedium, textTheme.titleLarge);

  TextStyle? get appBodyStyle => generateAdaptiveStyle(
      textTheme.bodySmall, textTheme.bodyMedium, textTheme.bodyLarge);
}
