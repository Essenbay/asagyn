import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazflow/feat/menu/logic/menu_model.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';

@JsonSerializable(createFactory: false)
class OrderRequest {
  final List<OrderItemRequest> items;
  final String note;
  final SessionModel? diningSessionDTO;
  final bool serveDrinksImmediatly;

  OrderRequest(
      {required this.items,
      required this.note,
      required this.diningSessionDTO,
      required this.serveDrinksImmediatly});

  Map<String, Object?> toJson() => {
        'dateOfCreation': null,
        'diningSessionDTO': diningSessionDTO?.toJson() ?? {},
        'orderItemDTOS': items.map((e) => e.toJson()).toList(),
        'orderStatus': 'Payed',
        'id': null,
      };
}

@JsonSerializable(createFactory: false)
class OrderItemRequest {
  final ProductModel productModel;
  final int quantity;

  OrderItemRequest({required this.productModel, required this.quantity});

  Map<String, Object?> toJson() => {
        'cost': productModel.cost,
        'description': productModel.description,
        'id': null,
        'quantity': productModel.quantity,
        'title': productModel.nameRu,
      };
}
