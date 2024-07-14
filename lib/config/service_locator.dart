import 'package:digital_manual/features/authentication/domain/use_cases/login_with_otp_use_case.dart';
import 'package:get_it/get_it.dart';

import '/features/authentication/data/data_source/auth_api.dart';
import '/features/authentication/data/repository/auth_repository_impl.dart';
import '/features/authentication/domain/repository/auth_repository.dart';
import '/features/authentication/presentation/cubit/auth_cubit.dart';
import '../features/authentication/domain/use_cases/send_phone_number_use_case.dart';

final serviceLocator = GetIt.instance;

void initDependancies() {
  _initAuth();
}

void _initAuth() {
  // Data
  serviceLocator.registerFactory<AuthApi>(() => AuthApiImpl());

  // Repository
  serviceLocator.registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()));

  // UseCase
  serviceLocator.registerFactory<SendPhoneNumberUseCase>(
      () => SendPhoneNumberUseCase(serviceLocator()));
  serviceLocator.registerFactory<LoginWithOtpUseCase>(
      () => LoginWithOtpUseCase(serviceLocator()));

  // BloC

  serviceLocator.registerLazySingleton<AuthCubit>(
      () => AuthCubit(serviceLocator(), serviceLocator()));
}
