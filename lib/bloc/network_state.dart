part of 'network_bloc.dart';

@immutable
abstract class NetworkState {}

class NetworkInitial extends NetworkState {}

class NetworkLoading extends NetworkState {}

class NetworkSuccess extends NetworkState {
  //results boolean field
  final bool connection;

  NetworkSuccess({required this.connection});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NetworkSuccess && other.connection == connection;
  }

  @override
  int get hashCode => connection.hashCode;

  @override
  String toString() => 'NetworkSuccess(connection: $connection)';

  NetworkSuccess copyWith({
    bool? connection,
  }) {
    return NetworkSuccess(
      connection: connection ?? this.connection,
    );
  }
}

class NetworkError extends NetworkState {
  final String message;
  NetworkError({
    required this.message,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NetworkError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  NetworkError copyWith({
    String? message,
  }) {
    return NetworkError(
      message: message ?? this.message,
    );
  }

  @override
  String toString() => 'NetworkError(message: $message)';
}
