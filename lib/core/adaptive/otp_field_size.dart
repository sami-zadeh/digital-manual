import 'package:digital_manual/core/adaptive/adaptive.dart';
import 'package:flutter/widgets.dart';

class OtpFieldSize {
  final BuildContext context;
  OtpFieldSize(this.context);

  double get size => Adaptive(context).isScreenSmall
      ? 45
      : Adaptive(context).isScreenMedium
          ? 55
          : 65;
}
