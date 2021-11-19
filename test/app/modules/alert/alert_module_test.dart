import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:arretadas/app/modules/alert/alert_module.dart';

void main() {
  setUpAll(() {
    initModule(AlertModule());
  });
}
