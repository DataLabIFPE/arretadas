import 'package:flutter_test/flutter_test.dart';
import 'package:arretadas/app/modules/alert/alert_store.dart';
 
void main() {
  late AlertStore store;

  setUpAll(() {
    store = AlertStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}