// ignore_for_file: void_checks

import 'package:digital_manual/core/user/domain/entites/user_entity.dart';
import 'package:fpdart/fpdart.dart';

import '/core/error/exception.dart';
import '/core/error/failure.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_api.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _authApi;
  AuthRepositoryImpl(this._authApi);

  @override
  Future<Either<Failure, void>> sendPhoneNumber(
    String phoneNumber,
    Function(String verificationId) getVid,
    Function(int? resendToken) resendToken,
    int? forceResendToken,
  ) async {
    try {
      await _authApi.sendPhoneNumber(
        phoneNumber: phoneNumber,
        getVid: getVid,
        resendToken: resendToken,
        forceResendToken: forceResendToken,
      );
      return const Right(unit);
    } on ServerException catch (error) {
      return Left(Failure(message: error.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithOTP({
    required String otpCode,
    required String vid,
  }) async {
    try {
      final response = await _authApi.loginWithOTP(
        otpCode: otpCode,
        vid: vid,
      );
      return Right(response);
    } on ServerException catch (error) {
      return Left(Failure(message: error.message));
    }
  }
}
