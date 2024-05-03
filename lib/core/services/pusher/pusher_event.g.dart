// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pusher_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PusherEventModel _$PusherEventModelFromJson(Map<String, dynamic> json) =>
    PusherEventModel(
      channelName: json['channelName'] as String,
      eventName: json['eventName'] as String,
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$PusherEventModelToJson(PusherEventModel instance) =>
    <String, dynamic>{
      'channelName': instance.channelName,
      'eventName': instance.eventName,
      'data': instance.data,
    };
