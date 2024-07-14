import 'package:digital_manual/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '/core/adaptive/otp_field_size.dart';
import '/core/common/widgets/buttons.dart';
import '/core/constants/colors.dart';

class OtpCodeSection extends StatefulWidget {
  const OtpCodeSection({super.key});

  @override
  State<OtpCodeSection> createState() => _OtpCodeSectionState();
}

class _OtpCodeSectionState extends State<OtpCodeSection> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          PinCodeTextField(
            autovalidateMode: AutovalidateMode.disabled,
            validator: (value) {
              if (value != null && value.length < 6) {
                return 'please fill all 6 digits';
              }
              return null;
            },
            appContext: context,
            length: 6,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8),
              fieldWidth: OtpFieldSize(context).size,
              fieldHeight: OtpFieldSize(context).size,
              inactiveColor: AppColors.lightNuetralColor,
              activeColor: AppColors.primaryColor,
              selectedColor: AppColors.primaryColor,
            ),
            onCompleted: (value) {
              context.read<AuthCubit>().loginWithOtp(value);
            },
            onSaved: (newValue) {
              context.read<AuthCubit>().loginWithOtp(newValue!);
            },
          ),
          verticalSpacer(),
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 50),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state.authStatus == AuthStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return PrimaryButton(
                    onPress: () {
                      var isValid = formKey.currentState!.validate();
                      if (isValid) {
                        formKey.currentState!.save();
                      }
                    },
                    label: 'Continue');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget verticalSpacer() => SizedBox.fromSize(size: const Size.fromHeight(50));
}
