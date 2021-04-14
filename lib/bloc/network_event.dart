part of 'network_bloc.dart';

@immutable
abstract class NetworkEvent {}

//start stream event of connectivity
class NetworkStarted extends NetworkEvent {}

//receive, checks connection
class NetworkReceived extends NetworkEvent {
  final Either<String, bool> received;
  NetworkReceived({
    required this.received,
  });

  NetworkReceived copyWith({
    Either<String, bool>? received,
  }) {
    return NetworkReceived(
      received: received ?? this.received,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NetworkReceived && other.received == received;
  }

  @override
  int get hashCode => received.hashCode;

  @override
  String toString() => 'NetworkReceived(received: $received)';
}
