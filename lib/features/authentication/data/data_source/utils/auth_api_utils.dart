import 'package:firebase_auth/firebase_auth.dart';

import '/core/error/exception.dart';
import '/core/user/data/models/user_model.dart';

// Define initial UserModel to be updated via authentication function
var userModel = const UserModel(id: '', phoneNumber: 0);

Future<UserModel?> verifyPhoneNumberHandler({
  required FirebaseAuth firebaseAuth,
  required int phoneNumber,
  int? otpCode,
}) async {
  await firebaseAuth.verifyPhoneNumber(
    phoneNumber: phoneNumber.toString(),
    verificationCompleted: (PhoneAuthCredential credential) async =>
        await autoVerificationHandler(credential, firebaseAuth),
    verificationFailed: (FirebaseAuthException error) =>
        throw ServerException(error.message!),
    codeSent: (verificationId, forceResendingToken) async =>
        await otpCodeHandler(otpCode, verificationId, firebaseAuth),
    codeAutoRetrievalTimeout: (verificationId) {},
  );
  return userModel;
}

Future<void> autoVerificationHandler(
  PhoneAuthCredential credential,
  FirebaseAuth firebaseAuth,
) async {
  if (credential.verificationId == null) return;

  final userCredential = await firebaseAuth.signInWithCredential(credential);

  userModel = updateUserModel(userCredential);
}

Future<void> otpCodeHandler(
  int? otpCode,
  String verificationId,
  FirebaseAuth firebaseAuth,
) async {
  if (otpCode != null) {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpCode.toString());

    final userCredential = await firebaseAuth.signInWithCredential(credential);

    userModel = updateUserModel(userCredential);
  }
}

UserModel updateUserModel(UserCredential userCredential) => userModel.copyWith(
      id: userCredential.user!.uid,
      phoneNumber: int.parse(userCredential.user!.phoneNumber!),
    );
