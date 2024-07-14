import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/core/user/domain/entites/user_entity.dart';
import '../../domain/use_cases/login_with_otp_use_case.dart';
import '../../domain/use_cases/send_phone_number_use_case.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SendPhoneNumberUseCase _sendPhoneNumberUseCase;
  final LoginWithOtpUseCase _loginWithOtpUseCase;

  AuthCubit(this._sendPhoneNumberUseCase, this._loginWithOtpUseCase)
      : super(const AuthState());

  String? vid;
  int? foreResendToken;

  void getVid(String verificationId) {
    vid = verificationId;
  }

  void getResendToken(int? resendToken) {
    foreResendToken = resendToken;
  }

  void getPhoneNumber(String phoneNumber) =>
      emit(state.copyWith(phoneNumber: phoneNumber));

  Future<void> sendPhoneNumber() async {
    emit(state.copyWith(authStatus: AuthStatus.loading));

    var result = await _sendPhoneNumberUseCase(
      SendPhoneNumberParams(
        phoneNumber: state.phoneNumber!,
        getVid: getVid,
        resendToken: getResendToken,
      ),
    );

    result.fold(
      (l) => emit(state.copyWith(
          authStatus: AuthStatus.failure, errorMessage: l.message)),
      (r) => emit(state.copyWith(authStatus: AuthStatus.success)),
    );
  }

  Future<void> reSendPhoneNumber() async {
    emit(state.copyWith(authStatus: AuthStatus.resendLoading));

    var result = await _sendPhoneNumberUseCase(
      SendPhoneNumberParams(
        phoneNumber: state.phoneNumber!,
        getVid: getVid,
        resendToken: getResendToken,
        forceResendToken: foreResendToken!,
      ),
    );

    result.fold(
      (l) => emit(state.copyWith(
          authStatus: AuthStatus.failure, errorMessage: l.message)),
      (r) => emit(state.copyWith(authStatus: AuthStatus.success)),
    );
  }

  Future<void> loginWithOtp(String otpCode) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));

    final result =
        await _loginWithOtpUseCase(LoginParams(otpCode: otpCode, vid: vid!));

    result.fold(
      (l) => emit(state.copyWith(
          authStatus: AuthStatus.failure, errorMessage: l.message)),
      (r) =>
          emit(state.copyWith(authStatus: AuthStatus.success, userEntity: r)),
    );
  }

  void resetState() => emit(
        state.copyWith(
          authStatus: AuthStatus.initial,
          phoneNumber: null,
          userEntity: null,
          errorMessage: null,
        ),
      );
}
