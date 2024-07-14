import 'package:firebase_auth/firebase_auth.dart';

import '/core/error/exception.dart';
import '/core/user/data/models/user_model.dart';
import 'utils/auth_api_utils.dart';

abstract interface class AuthApi {
  Future<void> sendPhoneNumber({
    required String phoneNumber,
    required Function(String verificationId) getVid,
    required Function(int? resendToken) resendToken,
    int? forceResendToken,
  });
  Future<UserModel> loginWithOTP({
    required String otpCode,
    required String vid,
  });
}

class AuthApiImpl implements AuthApi {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> sendPhoneNumber({
    required String phoneNumber,
    required Function(String verificationId) getVid,
    required Function(int? resendToken) resendToken,
    int? forceResendToken,
  }) async {
    try {
      await verifyPhoneNumber(
        firebaseAuth: firebaseAuth,
        phoneNumber: phoneNumber,
        getVid: getVid,
        resendToken: resendToken,
        forceResendToken: forceResendToken,
      );
    } on FirebaseAuthException catch (error) {
      throw ServerException(error.message!);
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<UserModel> loginWithOTP({
    required String otpCode,
    required String vid,
  }) async {
    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: vid, smsCode: otpCode);
      var userData = await firebaseAuth.signInWithCredential(credential);
      return UserModel(
        id: userData.user!.uid,
        phoneNumber: int.parse(userData.user!.phoneNumber!),
      );
    } on FirebaseAuthException catch (error) {
      throw ServerException(error.message!);
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}
