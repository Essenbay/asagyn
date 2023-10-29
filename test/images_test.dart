import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:zakazflow/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.ru).existsSync(), isTrue);
    expect(File(Images.appIcon).existsSync(), isTrue);
    expect(File(Images.boardingExample).existsSync(), isTrue);
    expect(File(Images.kz).existsSync(), isTrue);
  });
}
