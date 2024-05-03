import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazflow/core/extensions/datetime.dart';

part 'session_preview_model.g.dart';

@JsonSerializable()
class SessionPreview {
  final int id;
  final String establishmentName;
  final String? backgroundImage;
  @JsonKey(fromJson: DateTimeX.parseFromServer)
  final DateTime? sessionDate;

  SessionPreview(
      {required this.id,
      required this.establishmentName,
      required this.backgroundImage,
      required this.sessionDate});
}
