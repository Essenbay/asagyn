import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:zakazflow/resources/resources.dart';

void main() {
  test('custom_icons assets test', () {
    expect(File(CustomIcons.bell).existsSync(), isTrue);
    expect(File(CustomIcons.card).existsSync(), isTrue);
    expect(File(CustomIcons.cart).existsSync(), isTrue);
    expect(File(CustomIcons.chat).existsSync(), isTrue);
    expect(File(CustomIcons.checkFill).existsSync(), isTrue);
    expect(File(CustomIcons.copy).existsSync(), isTrue);
    expect(File(CustomIcons.createOrderFailure).existsSync(), isTrue);
    expect(File(CustomIcons.createOrderSuccess).existsSync(), isTrue);
    expect(File(CustomIcons.emptyTable).existsSync(), isTrue);
    expect(File(CustomIcons.error).existsSync(), isTrue);
    expect(File(CustomIcons.globe).existsSync(), isTrue);
    expect(File(CustomIcons.heart).existsSync(), isTrue);
    expect(File(CustomIcons.heartFill).existsSync(), isTrue);
    expect(File(CustomIcons.home).existsSync(), isTrue);
    expect(File(CustomIcons.logout).existsSync(), isTrue);
    expect(File(CustomIcons.menu).existsSync(), isTrue);
    expect(File(CustomIcons.order).existsSync(), isTrue);
    expect(File(CustomIcons.orderBig).existsSync(), isTrue);
    expect(File(CustomIcons.orderError).existsSync(), isTrue);
    expect(File(CustomIcons.orderLarge).existsSync(), isTrue);
    expect(File(CustomIcons.orderSuccess).existsSync(), isTrue);
    expect(File(CustomIcons.pen).existsSync(), isTrue);
    expect(File(CustomIcons.person).existsSync(), isTrue);
    expect(File(CustomIcons.phone).existsSync(), isTrue);
    expect(File(CustomIcons.processing).existsSync(), isTrue);
    expect(File(CustomIcons.question).existsSync(), isTrue);
    expect(File(CustomIcons.success).existsSync(), isTrue);
    expect(File(CustomIcons.telegram).existsSync(), isTrue);
    expect(File(CustomIcons.trash).existsSync(), isTrue);
    expect(File(CustomIcons.whatsapp).existsSync(), isTrue);
  });
}
