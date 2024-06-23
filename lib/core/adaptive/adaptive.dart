import 'package:flutter/material.dart';

class Adaptive {
  final BuildContext context;
  const Adaptive(this.context);

  static const smallScreenSize = 600;
  static const mediumScreenSize = 840;
  static const expandedScreenSize = 1200;

  double get screenSize => MediaQuery.sizeOf(context).width;
  double get screenHeight =>
      MediaQuery.sizeOf(context).height -
      (MediaQuery.of(context).padding.bottom +
          MediaQuery.of(context).padding.top);

  bool get isScreenSmall => screenSize < smallScreenSize;
  bool get isScreenMedium =>
      screenSize >= smallScreenSize && screenSize < mediumScreenSize;
  bool get isScreenExpanded => screenSize >= mediumScreenSize;

  bool get isProtrait =>
      MediaQuery.of(context).orientation == Orientation.portrait;
}
