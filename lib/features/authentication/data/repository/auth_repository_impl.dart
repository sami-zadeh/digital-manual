import 'package:fpdart/fpdart.dart';

import '/core/error/failure.dart';
import '/core/user/domain/entites/user_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '/core/error/exception.dart';
import '../data_source/auth_api.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _authApi;
  AuthRepositoryImpl(this._authApi);
  @override
  Future<Either<Failure, UserEntity?>> loginWithPhone({
    required String phoneNumber,
    int? otpCode,
  }) async {
    try {
      final response = await _authApi.loginWithPhoneNumber(
        phoneNumber: phoneNumber,
        otpCode: otpCode,
      );
      return Right(response);
    } on ServerException catch (error) {
      return Left(Failure(message: error.message));
    }
  }
}
