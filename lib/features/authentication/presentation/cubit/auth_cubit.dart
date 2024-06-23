import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/core/user/domain/entites/user_entity.dart';
import '../../domain/use_cases/login_with_phone_use_case.dart';
import 'phone_number_cubit.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginWithPhoneUseCase _loginWithPhoneUseCase;
  final PhoneNumberCubit _phoneNumberCubit;
  AuthCubit(this._loginWithPhoneUseCase, this._phoneNumberCubit)
      : super(const AuthState.initial());

  Future<void> logIn(int? otpCode) async {
    emit(const AuthState.loading());

    var result = await _loginWithPhoneUseCase(AuthParams(
        phoneNumber: _phoneNumberCubit.state.phoneNumber, otpCode: otpCode));

    result.fold(
      (l) => emit(AuthState.failure(l.message)),
      (r) => emit(AuthState.success(r)),
    );
  }
}
