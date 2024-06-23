import 'package:digital_manual/core/adaptive/adaptive.dart';
import 'package:flutter/material.dart';

class FontSize {
  final BuildContext context;
  FontSize(this.context);

  double get regularText => Adaptive(context).isScreenSmall
      ? 14
      : Adaptive(context).isScreenMedium
          ? 16
          : 18;
}
