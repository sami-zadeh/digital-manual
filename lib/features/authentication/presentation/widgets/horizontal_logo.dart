import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/core/adaptive/adaptive.dart';
import '/core/constants/images.dart';

class HorizontalLogo extends StatelessWidget {
  const HorizontalLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.horizontalLogo,
            width: Adaptive(context).isScreenSmall
                ? 260
                : Adaptive(context).isScreenMedium
                    ? 300
                    : 350,
          ),
        ],
      ),
    );
  }
}
