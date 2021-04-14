import 'package:connectivity_playground/repository/repository.dart';
import 'package:connectivity_playground/utils/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CheckConnection extends StreamUseCase<bool, NoParams> {
  CheckConnection(this._repository);

  @override
  Stream<Either<String, bool>> call(NoParams p) {
    return _repository.checkConnection();
  }

  final Repository _repository;
}
