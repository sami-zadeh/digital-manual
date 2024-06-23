import 'package:firebase_auth/firebase_auth.dart';

import '/core/error/exception.dart';
import '/core/user/data/models/user_model.dart';
import 'utils/auth_api_utils.dart';

abstract interface class AuthApi {
  Future<UserModel?> loginWithPhoneNumber({
    required String phoneNumber,
    int? otpCode,
  });
}

class AuthApiImpl implements AuthApi {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserModel?> loginWithPhoneNumber({
    required String phoneNumber,
    int? otpCode,
  }) async {
    try {
      return await verifyPhoneNumberHandler(
          firebaseAuth: firebaseAuth,
          phoneNumber: int.parse(phoneNumber),
          otpCode: otpCode);
    } on FirebaseAuthException catch (error) {
      throw ServerException(error.message!);
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}
