import 'package:digital_manual/config/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/route_config.dart';
import 'config/themes/main_theme.dart';
import 'features/authentication/presentation/cubit/auth_cubit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initDependancies();
  runApp(const DigitalManual());
}

class DigitalManual extends StatelessWidget {
  const DigitalManual({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (FocusManager.instance.primaryFocus != null &&
            FocusManager.instance.primaryFocus!.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(serviceLocator(), serviceLocator()),
          )
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Digital Manual',
          theme: appTheme,
          routerConfig: appRouter,
          builder: (context, child) => StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => appRouter.go(RouteNames.homeScreen),
                );
              } else {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => appRouter.go(RouteNames.loginScreen),
                );
              }
              return child!;
            },
          ),
        ),
      ),
    );
  }
}
