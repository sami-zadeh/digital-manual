import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_number_state.dart';

class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  PhoneNumberCubit() : super(const PhoneNumberState(''));

  void getPhoneNumber(List<int> phoneDigitList) {
    var phoneNumber = phoneDigitList.join('');
    emit(PhoneNumberState(phoneNumber));
  }
}
