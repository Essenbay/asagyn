import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_preview_model.g.dart';

@JsonSerializable()
class SessionPreview {
  final int id;
  final String establishmentName;
  final String? backgroundImage;
  final DateTime? sessionDate;

  SessionPreview(
      {required this.id,
      required this.establishmentName,
      required this.backgroundImage,
      required this.sessionDate});
}
