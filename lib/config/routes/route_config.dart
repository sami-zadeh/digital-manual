import 'package:go_router/go_router.dart';

import '/features/authentication/presentation/screens/login_screen.dart';
import '/features/authentication/presentation/screens/why_sign_up_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: 'whySignUp',
      path: '/why-sign-up',
      builder: (context, state) => const WhySignUpScreen(),
    )
  ],
);

class RouteNames {
  static const whySignUp = '/why-sign-up';
}
