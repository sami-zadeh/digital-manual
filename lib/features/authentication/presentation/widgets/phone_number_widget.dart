import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '/config/routes/route_config.dart';
import '/core/adaptive/text_style.dart';
import '/core/common/widgets/buttons.dart';
import '../cubit/auth_cubit.dart';

class PhoneNumberFormWidget extends StatefulWidget {
  const PhoneNumberFormWidget({
    super.key,
  });

  @override
  State<PhoneNumberFormWidget> createState() => _PhoneNumberFormWidgetState();
}

class _PhoneNumberFormWidgetState extends State<PhoneNumberFormWidget> {
  final formKey = GlobalKey<FormState>();
  var _autoValidate = false;

  Future<void> submitPhoneNumber() async {
    await context.read<AuthCubit>().sendPhoneNumber();
    if (FocusManager.instance.primaryFocus != null &&
        FocusManager.instance.primaryFocus!.hasFocus) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: _autoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: Column(
        children: [
          phoneNumberFiled(),
          verticalSpacer(),
          buttonContainer(),
        ],
      ),
    );
  }

  Widget phoneNumberFiled() => Container(
        constraints: const BoxConstraints(maxWidth: 800),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            context.read<AuthCubit>().getPhoneNumber(number.phoneNumber!);
          },
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            useBottomSheetSafeArea: true,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          formatInput: true,
          textAlign: TextAlign.center,
          onSaved: (PhoneNumber number) async => await submitPhoneNumber(),
          onFieldSubmitted: (value) async => await submitPhoneNumber(),
        ),
      );

  Widget verticalSpacer() => const SizedBox(height: 20);

  Widget buttonContainer() => Container(
        constraints: const BoxConstraints(maxWidth: 700),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state.authStatus == AuthStatus.loading) {
              const Center(child: CircularProgressIndicator());
            }

            if (state.authStatus == AuthStatus.failure) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        'Sending phone number is failed',
                        style: AppTextStyle(context).appHeadStyle,
                      ),
                      content: Text(
                        state.errorMessage!,
                        style: AppTextStyle(context).appBodyStyle,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'OK',
                            style: AppTextStyle(context).appLableStyle,
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }

            if (state.authStatus == AuthStatus.success) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  context.go(RouteNames.otpScreen);
                },
              );
            }

            return PrimaryButton(
                onPress: () {
                  context.push(RouteNames.otpScreen);
                  if (!_autoValidate) {
                    setState(() => _autoValidate = true);
                  }

                  final isValid = formKey.currentState?.validate();

                  if (isValid != null && isValid) {
                    formKey.currentState!.save();
                  }
                },
                label: 'Get Code');
          },
        ),
      );
}
