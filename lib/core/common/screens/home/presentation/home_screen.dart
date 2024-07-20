import 'package:flutter/material.dart';

import '../../../../adaptive/text_style.dart';
import '../../../../constants/images.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/spacers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Image.asset(AppImages.homeScreenImage)),
            staticVerticalSpacer(55),
            Text(
              'Welcome to Digx!',
              style: AppTextStyle(context)
                  .appHeadStyle
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'The future of product ownership experience',
              style: AppTextStyle(context)
                  .appBodyStyle
                  ?.apply(fontSizeFactor: 1.4),
            ),
            staticVerticalSpacer(66),
            Text(
              'Welcome to Digx!',
              style: AppTextStyle(context)
                  .appHeadStyle
                  ?.copyWith(fontWeight: FontWeight.bold)
                  .apply(fontSizeFactor: 0.8),
            ),
            Text(
              'Start by scanning the QR code.',
              style: AppTextStyle(context)
                  .appBodyStyle
                  ?.apply(fontSizeFactor: 1.4),
            ),
            staticVerticalSpacer(20),
            fullWidthButton(
              PrimaryButton(onPress: () {}, label: 'Start From Here'),
            ),
          ],
        ),
      ),
    );
  }
}
