import 'package:fpdart/fpdart.dart';

import '/core/error/failure.dart';
import '/core/user/domain/entites/user_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserEntity?>> loginWithPhone(
      {required String phoneNumber, int? otpCode});
}
