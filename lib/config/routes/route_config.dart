import 'package:digital_manual/core/common/widgets/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '/core/home/presentation/home_screen.dart';
import '/features/authentication/presentation/screens/login_screen.dart';
import '/features/authentication/presentation/screens/otp_screen.dart';
import '/features/authentication/presentation/screens/phone_number_screen.dart';
import '/features/authentication/presentation/screens/why_sign_up_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      name: 'splash',
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: 'login',
      path: '/auth/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: 'whySignUp',
      path: '/auth/why-sign-up',
      builder: (context, state) => const WhySignUpScreen(),
    ),
    GoRoute(
      name: 'phone-number',
      path: '/auth/phone-number',
      builder: (context, state) => const PhoneNumberScreen(),
    ),
    GoRoute(
      name: 'otp',
      path: '/auth/otp',
      builder: (context, state) => const OTPScreen(),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);

class RouteNames {
  static const splashScreen = '/splash';
  static const loginScreen = '/auth/login';
  static const whySignUpScreen = '/auth/why-sign-up';
  static const phoneNumberScreen = '/auth/phone-number';
  static const otpScreen = '/auth/otp';
  static const homeScreen = '/home';
}
