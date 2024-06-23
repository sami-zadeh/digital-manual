import 'package:flutter/material.dart';

import '/core/common/widgets/buttons.dart';
import 'login_button.dart';

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
              LoginButton(
                appButton: SecondaryButton(onPress: () {}, label: 'Login'),
              ),
              spacer(30),
              LoginButton(
                appButton:
                    PrimaryButton(onPress: () {}, label: 'Create My Account'),
              ),
              spacer(30),
              underlineTextButton(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget underlineTextButton() {
  return Container(
    margin: const EdgeInsets.only(bottom: 30),
    child: InkWell(
      onTap: () {},
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
