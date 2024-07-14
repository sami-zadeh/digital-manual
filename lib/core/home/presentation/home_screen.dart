import 'package:digital_manual/config/routes/route_config.dart';
import 'package:digital_manual/core/common/widgets/buttons.dart';
import 'package:digital_manual/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Home page'),
            ),
            PrimaryButton(
                onPress: () async {
                  await FirebaseAuth.instance.signOut();
                  if (context.mounted) {
                    context.read<AuthCubit>().resetState();
                    context.push(RouteNames.splashScreen);
                  }
                },
                label: 'Sign out')
          ],
        ),
      ),
    );
  }
}
