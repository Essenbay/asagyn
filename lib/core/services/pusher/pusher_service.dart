import 'dart:async';
import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:zakazflow/core/services/pusher/pusher_logger.dart';

const String pusherAppKey = '1b1aac5f3ed531c5e179';
const String pusherCluster = 'ap2';
const String channelName = 'AsAgyn-channel';

@LazySingleton()
class PusherService {
  final PusherLogger _logger;

  final PusherChannelsFlutter pusher;

  final StreamController<PusherEvent> _pusherEvents =
      StreamController.broadcast();
  Stream<PusherEvent> get pusherEvents => _pusherEvents.stream;

  PusherService(this._logger, this.pusher);

  void initPusher() async {
    try {
      await pusher.init(
        apiKey: pusherAppKey,
        cluster: pusherCluster,
        onConnectionStateChange: _logger.onConnectionStateChange,
        onDecryptionFailure: _logger.onDecryptionFailure,
        onError: _logger.onError,
        onSubscriptionError: _logger.onSubscriptionError,
        onSubscriptionSucceeded: _logger.onSubscriptionSucceeded,
        onSubscriptionCount: _logger.onSubscriptionCount,
        onAuthorizer: (channelName, socketId, options) async {
          log('Authorized');
        },
        onEvent: (event) => onEvent,
      );

      await pusher.subscribe(
        channelName: channelName,
        onEvent: onChannelEvent,
        onSubscriptionError: (e) {
          log('Error while subscription');
        },
      );
      await pusher.connect();
    } catch (e) {
      log('ERROR while connecting pusher: $e');
    }
  }

  void onEvent(PusherEvent event) async {
    log('OnEvent: $event');

    // final parsedData = jsonDecode(event.data);
    // final response = OrderResponse.fromJson(parsedData);

    // if (response.orderStatus == OrderStatus.completed) {
    //   initPusher();
    // } else {
    //   print('Pusher orders');
    // }

    // log('Response from Pusher: $response');
  }

  void onChannelEvent(dynamic event) async {
    log('Channel event: ${event}');
    if (event is PusherEvent) {
      _pusherEvents.add(event);
    }
    // if (event is Map) {
    //   final eventModel =
    //       PusherEventModel.fromJson(event as Map<String, dynamic>);
    //   _pusherEvents.add(eventModel);
    // }
    // if (event is String) {
    //   final json = jsonDecode(event);
    //   final eventModel =
    //       PusherEventModel.fromJson(json as Map<String, dynamic>);
    //   _pusherEvents.add(eventModel);
    // }
    // final parsedData = jsonDecode(event.data);
    // final response = OrderResponse.fromJson(parsedData);

    // if (response.orderStatus == OrderStatus.completed) {
    //   initPusher();
    // } else {
    //   print('Pusher orders');
    // }

    // log('Response from Pusher: $response');
  }

  void disconnect() {
    _pusherEvents.close();
    pusher.unsubscribe(channelName: channelName);
    pusher.disconnect();
  }

  Future<String> getSocketId() async {
    return await pusher.getSocketId();
  }
}
