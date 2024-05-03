import 'package:freezed_annotation/freezed_annotation.dart';

part 'pusher_event.g.dart';

@JsonSerializable()
class PusherEventModel {
  final String channelName;
  final String eventName;
  final Map data;

  PusherEventModel(
      {required this.channelName, required this.eventName, required this.data});

  factory PusherEventModel.fromJson(Map<String, Object?> json) =>
      _$PusherEventModelFromJson(json);
}
