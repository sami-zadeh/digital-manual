import 'package:firebase_auth/firebase_auth.dart';

import '/core/error/exception.dart';

Future<void> verifyPhoneNumber({
  required FirebaseAuth firebaseAuth,
  required String phoneNumber,
  required Function(String verificationId) getVid,
  required Function(int? resendToken) resendToken,
  int? forceResendToken,
}) async {
  await firebaseAuth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    forceResendingToken: forceResendToken,
    verificationCompleted: (PhoneAuthCredential credential) async =>
        await autoVerificationHandler(credential, firebaseAuth),
    verificationFailed: (FirebaseAuthException error) =>
        throw ServerException(error.message ?? error.toString()),
    codeSent: (verificationId, forceResendingToken) {
      getVid(verificationId);
      resendToken(forceResendingToken);
    },
    codeAutoRetrievalTimeout: (verificationId) {},
  );
}

Future<void> autoVerificationHandler(
  PhoneAuthCredential credential,
  FirebaseAuth firebaseAuth,
) async {
  if (credential.verificationId == null) return;

  await firebaseAuth.signInWithCredential(credential);
}
