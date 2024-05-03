// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionPreview _$SessionPreviewFromJson(Map<String, dynamic> json) =>
    SessionPreview(
      id: json['id'] as int,
      establishmentName: json['establishmentName'] as String,
      backgroundImage: json['backgroundImage'] as String?,
      sessionDate: DateTimeX.parseFromServer(json['sessionDate'] as String),
    );

Map<String, dynamic> _$SessionPreviewToJson(SessionPreview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'establishmentName': instance.establishmentName,
      'backgroundImage': instance.backgroundImage,
      'sessionDate': instance.sessionDate?.toIso8601String(),
    };
