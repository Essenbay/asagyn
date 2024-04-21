import 'package:freezed_annotation/freezed_annotation.dart';
part 'establishment_model.g.dart';

@JsonSerializable()
class EstablishmentModel {
  final int id;
  final String establishmentName;
  final double servingPercentage;
  final String? backgroundImage;

  EstablishmentModel(
      {required this.id,
      required this.establishmentName,
      required this.servingPercentage,
      required this.backgroundImage});

  factory EstablishmentModel.fromJson(Map<String, Object?> json) =>
      _$EstablishmentModelFromJson(json);

  Map<String, Object?> toJson() => _$EstablishmentModelToJson(this);
}
