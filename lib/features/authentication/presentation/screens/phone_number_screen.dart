import 'package:flutter/material.dart';

import '/core/adaptive/text_style.dart';
import '/core/constants/authentication_const_text.dart';
import '/core/constants/colors.dart';
import '/core/constants/images.dart';
import '../widgets/phone_number_widget.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      verticalDynamicSpacer(),
                      phoneNumberTitle(context),
                      verticalSpacer(),
                      phoneNumberSubTitle(context),
                      verticalSpacer(),
                      const PhoneNumberFormWidget(),
                    ],
                  ),
                  phoneNumberImage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget verticalDynamicSpacer() => Flexible(
        flex: 1,
        child: Container(),
      );

  Widget phoneNumberTitle(BuildContext context) => Flexible(
        flex: 1,
        child: Text(
          AuthenticationConstText.phoneNumberTitle,
          textAlign: TextAlign.center,
          style: AppTextStyle(context).appDisplayStyle?.apply(
                fontSizeFactor: 0.7,
              ),
        ),
      );

  Widget verticalSpacer() => const SizedBox(height: 20);

  Widget phoneNumberSubTitle(BuildContext context) => Flexible(
        flex: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                AuthenticationConstText.phoneNumberSubTitle,
                style: AppTextStyle(context).appBodyStyle?.apply(
                    color: AppColors.secondaryColor, fontSizeFactor: 1.2),
              ),
            )
          ],
        ),
      );

  Widget phoneNumberImage() => Expanded(
        child: Image.asset(
          AppImages.phoneNumberImage,
          alignment: Alignment.bottomCenter,
        ),
      );
}
