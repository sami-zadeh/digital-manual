import 'package:digital_manual/config/routes/route_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/core/common/widgets/buttons.dart';
import 'wide_button.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WideButton(
                appButton: SecondaryButton(onPress: () {}, label: 'Login'),
              ),
              spacer(30),
              WideButton(
                appButton:
                    PrimaryButton(onPress: () {}, label: 'Create My Account'),
              ),
              spacer(30),
              underlineTextButton(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget underlineTextButton(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(bottom: 30),
    child: InkWell(
      onTap: () => context.push(RouteNames.whySignUp),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.white, width: 1),
          ),
        ),
        child: const Text(
          'Why users need an account?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    ),
  );
}

Widget spacer(double space) => SizedBox(height: space);
