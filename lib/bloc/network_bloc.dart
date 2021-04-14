import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_playground/usecase/check_connection.dart';
import 'package:connectivity_playground/utils/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'network_event.dart';
part 'network_state.dart';

@injectable
class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc(this._checkConnection) : super(NetworkInitial());

  final CheckConnection _checkConnection;

  StreamSubscription<Either<String, bool>>? _connectionSubscription;

  @override
  Stream<NetworkState> mapEventToState(
    NetworkEvent event,
  ) async* {
    if (event is NetworkStarted) {
      //cancels stream if exist
      await _connectionSubscription?.cancel();
      _connectionSubscription = _checkConnection.call(NoParams()).listen(
            (connection) => add(
              NetworkReceived(received: connection),
            ),
          ); //add recieved event
    }
    if (event is NetworkReceived) {
      yield NetworkLoading();
      yield event.received.fold(
        (failure) => NetworkError(message: failure),
        (status) => NetworkSuccess(connection: status),
      );
    }
  }
}
