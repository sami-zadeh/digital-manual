// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';

import '/core/error/failure.dart';
import '/core/use_case/use_case.dart';
import '/core/user/domain/entites/user_entity.dart';
import '../repository/auth_repository.dart';

class LoginWithOtpUseCase implements FutureUseCase<UserEntity, LoginParams> {
  final AuthRepository _authRepository;
  LoginWithOtpUseCase(this._authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return await _authRepository.loginWithOTP(
      otpCode: params.otpCode,
      vid: params.vid,
    );
  }
}

class LoginParams {
  String otpCode;
  String vid;
  LoginParams({
    required this.otpCode,
    required this.vid,
  });
}
