import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';
part 'establishment_model.g.dart';

@JsonSerializable()
class EstablishmentModel {
  final int id;
  final String establishmentName;
  final double servingPercentage;
  final String? backgroundImage;
  final List<PaymentMethod>? paymentMethods;

  EstablishmentModel(
      {required this.id,
      required this.establishmentName,
      required this.servingPercentage,
      required this.paymentMethods,
      required this.backgroundImage});

  factory EstablishmentModel.fromJson(Map<String, Object?> json) =>
      _$EstablishmentModelFromJson(json);

  Map<String, Object?> toJson() => _$EstablishmentModelToJson(this);
}
