import 'package:injectable/injectable.dart';
import 'package:l/l.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

@LazySingleton()
class PusherLogger {
  void _log(void Function(StringBuffer buffer) assemble) {
    final buffer = StringBuffer('PusherObserver | ');

    assemble(buffer);

    l.d('$buffer        ');
  }

  void onCreate() {
    _log((buffer) => buffer..write('Created '));
  }

  void onAuthorizer(String channelName, String socketId, dynamic options) =>
      _log(
        (buffer) => buffer
          ..write('Authorized:')
          ..write(' Channeld name: ')
          ..write(channelName)
          ..write(' SocketId: ')
          ..write(socketId)
          ..write(' Options: ')
          ..write(options),
      );
  void onConnectionStateChange(String currentState, String previousState) =>
      _log(
        (buffer) => buffer
          ..write(' Connection transition:  ')
          ..write(previousState)
          ..write(' -> ')
          ..write(currentState),
      );

  void onDecryptionFailure(String event, String reason) => _log(
        (buffer) => buffer
          ..write('Decryption Failure: ')
          ..write(' Event: ')
          ..write(event)
          ..write(' Reason:')
          ..write(reason),
      );

  void onError(String message, int? code, dynamic error) => _log(
        (buffer) =>
            buffer..write('Error: $error. Message: $message. Code: $code   '),
      );

  void onSubscriptionError(String message, dynamic error) => _log(
        (buffer) => buffer
          ..write('Subscription Error: ')
          ..write(message)
          ..write(error),
      );

  void onSubscriptionSucceeded(String channelName, dynamic data) => _log(
        (buffer) => buffer
          ..write(
              'Subscription success. Channel name: $channelName, data: $data'),
      );
  void onSubscriptionCount(String channelName, int subscriptionCount) => _log(
        (buffer) => buffer
          ..write(
              'Subscription count. Channel name: $channelName, count: $subscriptionCount'),
      );
  void onEvent(PusherEvent event) => _log(
        (buffer) =>
            buffer..write('Event in ${event.channelName}: ${event.eventName}'),
      );
}
