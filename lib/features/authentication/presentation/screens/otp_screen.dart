import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/adaptive/text_style.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/otp_code_section.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacer(),
                Text(
                  'One time password sent to:',
                  style: AppTextStyle(context).appTitleStyle,
                  textAlign: TextAlign.start,
                ),
                Text(
                  context.read<AuthCubit>().state.phoneNumber ?? '',
                  style: AppTextStyle(context).appTitleStyle,
                  textAlign: TextAlign.start,
                ),
                verticalSpacer(),
                Text(
                  'Didn’t receive it after 5 minutes?',
                  style: AppTextStyle(context).appTitleStyle,
                  textAlign: TextAlign.start,
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state.authStatus == AuthStatus.resendLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return TextButton(
                      onPressed: () async =>
                          await context.read<AuthCubit>().reSendPhoneNumber(),
                      child: Text(
                        'RESEND',
                        style: AppTextStyle(context).appTitleStyle,
                        textAlign: TextAlign.start,
                      ),
                    );
                  },
                ),
                verticalSpacer(),
                Text(
                  'ENTER THE ONE TIME PASSWORD',
                  style: AppTextStyle(context).appHeadStyle,
                  textAlign: TextAlign.center,
                ),
                verticalSpacer(),
                const OtpCodeSection()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget verticalSpacer() => SizedBox.fromSize(size: const Size.fromHeight(30));
}
