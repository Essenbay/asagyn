import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  final int id;
  final String username;
  final String email;

  ProfileModel({required this.id, required this.username, required this.email});

  factory ProfileModel.fromJson(Map<String, Object?> json) =>
      _$ProfileModelFromJson(json);
  Map<String, Object?> toJson() => _$ProfileModelToJson(this);
}
