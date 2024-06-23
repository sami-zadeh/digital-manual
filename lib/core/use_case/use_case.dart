import 'package:digital_manual/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class FutureUseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

abstract interface class UseCase<SuccessType, Params> {
  Either<Failure, SuccessType> call(Params params);
}

class NoParams {}
