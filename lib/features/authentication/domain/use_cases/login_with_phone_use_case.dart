import 'package:fpdart/fpdart.dart';

import '/core/error/failure.dart';
import '/core/use_case/use_case.dart';
import '/core/user/domain/entites/user_entity.dart';
import '../repository/auth_repository.dart';

class LoginWithPhoneUseCase implements FutureUseCase<UserEntity?, AuthParams> {
  final AuthRepository _authRepository;
  LoginWithPhoneUseCase(this._authRepository);
  @override
  Future<Either<Failure, UserEntity?>> call(AuthParams authParams) async {
    return await _authRepository.loginWithPhone(
      phoneNumber: authParams.phoneNumber,
      otpCode: authParams.otpCode,
    );
  }
}

class AuthParams {
  final String phoneNumber;
  int? otpCode;
  AuthParams({required this.phoneNumber, this.otpCode});
}
