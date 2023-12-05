import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/models/result.dart';
import 'package:zakazflow/core/util/example.dart';
import 'package:zakazflow/feat/profilemenu/my_sessions/logic/session_preview_model.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';
import 'package:zakazflow/feat/session/logic/session_repository.dart';

@LazySingleton(as: SessionRepository)
class SessionRepositoryMock implements SessionRepository {
  Future<Result<SessionModel?>> getSessionInfo() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return Result.success(result);
  }

  @override
  Future<Result<List<SessionPreview>>> getSessions() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    // return Result.success(null);

    return Result.success([preview, preview]);
  }

  @override
  Future<Result<SessionModel>> getSession(int id) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return Result.success(result);
  }
}

final orders = <OrderModel>[
  OrderModel(
    status: OrderStatus.processing,
    id: 151,
    createdTime: DateTime.now().subtract(const Duration(minutes: 5)),
    readyTime: DateTime.now().add(const Duration(minutes: 20)),
    items: [
      OrderItem(
        title: 'Бургер',
        description:
            'Говядина, с кользами свежих томатов и репчатого лука, с хрустящим айсбергом и плавленным сыром Чеддер, заправлленная фирменным соусом',
        quantity: 2,
        cost: 3000,
        image: productImage,
      ),
    ],
  ),
  OrderModel(
    status: OrderStatus.cooking,
    id: 151,
    createdTime: DateTime.now().subtract(const Duration(minutes: 10)),
    readyTime: DateTime.now().add(const Duration(minutes: 10)),
    items: [
      OrderItem(
        title: 'Бургер',
        description:
            'Говядина, с кользами свежих томатов и репчатого лука, с хрустящим айсбергом и плавленным сыром Чеддер, заправлленная фирменным соусом',
        quantity: 2,
        cost: 3000,
        image: productImage,
      ),
    ],
  ),
  OrderModel(
    status: OrderStatus.serving,
    id: 150,
    createdTime: DateTime.now().subtract(const Duration(minutes: 15)),
    readyTime: DateTime.now().add(const Duration(minutes: 3)),
    items: [
      OrderItem(
        title: 'Бургер',
        description:
            'Говядина, с кользами свежих томатов и репчатого лука, с хрустящим айсбергом и плавленным сыром Чеддер, заправлленная фирменным соусом',
        quantity: 1,
        cost: 1550,
        image: productImage,
      ),
      OrderItem(
        title: 'Бургер',
        description:
            'Говядина, с кользами свежих томатов и репчатого лука, с хрустящим айсбергом и плавленным сыром Чеддер, заправлленная фирменным соусом',
        quantity: 2,
        cost: 3000,
        image: productImage,
      ),
    ],
  ),
  OrderModel(
    status: OrderStatus.served,
    id: 151,
    createdTime: DateTime.now().subtract(const Duration(minutes: 40)),
    readyTime: DateTime.now().subtract(const Duration(minutes: 10)),
    items: [
      OrderItem(
        title: 'Бургер',
        description:
            'Говядина, с кользами свежих томатов и репчатого лука, с хрустящим айсбергом и плавленным сыром Чеддер, заправлленная фирменным соусом',
        quantity: 2,
        cost: 3000,
        image: productImage,
      ),
    ],
  ),
];
final result = SessionModel(
    allItems: [
      OrderItem(
        title: 'Бургер',
        description:
            'Говядина, с кользами свежих томатов и репчатого лука, с хрустящим айсбергом и плавленным сыром Чеддер, заправлленная фирменным соусом',
        quantity: 5,
        cost: 5500,
        image: productImage,
      ),
    ],
    paymentMethods: [
      PaymentMethod(id: 1, name: 'Наличными'),
      PaymentMethod(id: 2, name: 'Картой')
    ],
    establishmentName: 'Malina Mix',
    establishmentCode: '4X89MMDI',
    tableCode: 2,
    backgroundImage: estab_background,
    sessionDate: DateTime.now(),
    total: 10550,
    orderTotal: 9850,
    servingPercentage: 10.0,
    orders: orders,
    servingAmount: 1350);

final preview = SessionPreview(
    id: 0,
    establishmentName: 'Malina Mix',
    backgroundImage: estab_background,
    sessionDate: DateTime.now());
