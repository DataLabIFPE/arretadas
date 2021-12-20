// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_test/flutter_test.dart';
import 'package:arretadas/app/modules/menu/menu_store.dart';

void main() {
  late MenuStore store;

  setUpAll(() {
    store = MenuStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}
