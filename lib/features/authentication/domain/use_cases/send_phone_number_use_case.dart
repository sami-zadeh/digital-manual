// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';

import '/core/error/failure.dart';
import '/core/use_case/use_case.dart';
import '../repository/auth_repository.dart';

class SendPhoneNumberUseCase
    implements FutureUseCase<void, SendPhoneNumberParams> {
  final AuthRepository _authRepository;
  SendPhoneNumberUseCase(this._authRepository);
  @override
  Future<Either<Failure, void>> call(SendPhoneNumberParams params) async {
    return await _authRepository.sendPhoneNumber(
      params.phoneNumber,
      params.getVid,
      params.resendToken,
      params.forceResendToken,
    );
  }
}

class SendPhoneNumberParams {
  String phoneNumber;
  Function(String verificationId) getVid;
  Function(int? resendToken) resendToken;
  int? forceResendToken;
  SendPhoneNumberParams({
    required this.phoneNumber,
    required this.getVid,
    required this.resendToken,
    this.forceResendToken,
  });
}
