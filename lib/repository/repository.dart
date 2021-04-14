import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

abstract class Repository {
  Stream<Either<String, bool>> checkConnection();
}

@LazySingleton(as: Repository)
class RepositoryImpl implements Repository {
  final Connectivity _connectivity;

  RepositoryImpl(this._connectivity);
  @override
  Stream<Either<String, bool>> checkConnection() async* {
    yield* _connectivity.onConnectivityChanged.map((results) {
      if (results == ConnectivityResult.none) {
        return right<String, bool>(false);
      }
      return right<String, bool>(true);
    }).onErrorReturnWith((error) {
      print(error.toString());
      return left("Error in checking connection");
    });
  }
}
