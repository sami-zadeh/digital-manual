import 'package:flutter/material.dart';

import '/core/constants/authentication_const_text.dart';
import '../widgets/bullet_text.dart';
import '../widgets/wide_button.dart';
import '/core/adaptive/text_style.dart';
import '/core/common/widgets/buttons.dart';
import '/core/constants/colors.dart';

class WhySignUpScreen extends StatelessWidget {
  const WhySignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: whySignUpContainer(whySignUpContent(context)),
      ),
    );
  }
}

Widget whySignUpContainer(Widget child) => Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.lightSecondaryColor,
            Colors.white,
          ],
        ),
      ),
      child: child,
    );

Widget whySignUpContent(BuildContext context) => Column(
      children: [
        spacer(),
        whySignUpText(context),
      ],
    );

Widget spacer() => Flexible(
      flex: 1,
      child: Container(),
    );

Widget whySignUpText(BuildContext context) => Flexible(
      flex: 6,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AuthenticationConstText.whySignUpTitle,
              style: AppTextStyle(context).appHeadStyle,
            ),
            const SizedBox(height: 10),
            Text(
              AuthenticationConstText.whySignUpSubTitle,
              style: AppTextStyle(context).appTitleStyle?.apply(
                    color: AppColors.darkSecondaryColor,
                    fontSizeFactor: 1.3,
                  ),
            ),
            const SizedBox(height: 10),
            ...AuthenticationConstText.whySignUpBulletContent.map(
              (content) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: BulletText(content: content),
              ),
            ),
          ],
        ),
      ),
    );

Widget whySignUpButton() => Flexible(
      flex: 2,
      child: WideButton(
        appButton: PrimaryButton(onPress: () {}, label: 'Craete My Account'),
      ),
    );
