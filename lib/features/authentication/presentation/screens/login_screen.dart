import 'package:flutter/material.dart';

import '/core/adaptive/adaptive.dart';
import '../widgets/horizontal_logo.dart';
import '../widgets/login_buttons.dart';
import '/core/constants/images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: loginContainer(context, loginContent()),
      ),
    );
  }
}

Widget loginContainer(BuildContext context, Widget child) => Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(AppImages.loginBackground),
          fit: Adaptive(context).isScreenSmall
              ? BoxFit.fitWidth
              : BoxFit.scaleDown,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );

Widget loginContent() => const Column(
      children: [HorizontalLogo(), LoginButtons()],
    );
