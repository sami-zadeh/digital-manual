import 'package:flutter/material.dart';

Widget dynamicVerticalSpacer(int flexNumber) => Flexible(
      flex: flexNumber,
      child: const SizedBox.expand(),
    );

Widget staticVerticalSpacer(double distance) => SizedBox(
      height: distance,
    );
