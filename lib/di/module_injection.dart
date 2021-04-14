import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';

@module
abstract class Module {
  @lazySingleton
  Connectivity get connectivity => Connectivity();
}
