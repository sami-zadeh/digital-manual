import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/config/routes/route_config.dart';
import '/core/common/widgets/buttons.dart';

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
              fullWidthButton(
                SecondaryButton(
                    onPress: () => context.push(RouteNames.phoneNumberScreen),
                    label: 'Login'),
              ),
              spacer(30),
              fullWidthButton(
                PrimaryButton(
                    onPress: () => context.push(RouteNames.phoneNumberScreen),
                    label: 'Create My Account'),
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
      onTap: () => context.push(RouteNames.whySignUpScreen),
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
