import 'package:digital_manual/core/common/widgets/buttons.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final AppButtons appButton;
  const LoginButton({super.key, required this.appButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: appButton,
    );
  }
}
