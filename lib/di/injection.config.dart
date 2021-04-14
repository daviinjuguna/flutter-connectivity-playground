// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity/connectivity.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/network_bloc.dart' as _i6;
import '../repository/repository.dart' as _i4;
import '../usecase/check_connection.dart' as _i5;
import 'module_injection.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final module = _$Module();
  gh.lazySingleton<_i3.Connectivity>(() => module.connectivity);
  gh.lazySingleton<_i4.Repository>(
      () => _i4.RepositoryImpl(get<_i3.Connectivity>()));
  gh.lazySingleton<_i5.CheckConnection>(
      () => _i5.CheckConnection(get<_i4.Repository>()));
  gh.factory<_i6.NetworkBloc>(
      () => _i6.NetworkBloc(get<_i5.CheckConnection>()));
  return get;
}

class _$Module extends _i7.Module {}
