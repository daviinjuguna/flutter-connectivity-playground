import 'package:dartz/dartz.dart';

abstract class StreamUseCase<Type, Params> {
  Stream<Either<String, Type>> call(Params p);
}

class NoParams {}
