import 'package:fpdart/fpdart.dart';

import '/core/error/failure.dart';
import '/core/user/domain/entites/user_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, void>> sendPhoneNumber(
    String phoneNumber,
    Function(String verificationId) getVid,
    Function(int? resendToken) resendToken,
    int? forceResendToken,
  );

  Future<Either<Failure, UserEntity>> loginWithOTP({
    required String otpCode,
    required String vid,
  });
}
