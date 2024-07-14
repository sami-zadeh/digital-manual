part of 'auth_cubit.dart';

enum AuthStatus { initial, loading, success, failure, resendLoading }

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) authStatus,
    String? phoneNumber,
    String? errorMessage,
    UserEntity? userEntity,
  }) = _AuthState;
}
