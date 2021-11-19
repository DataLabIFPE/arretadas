import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:arretadas/app/modules/menu/menu_module.dart';

void main() {
  setUpAll(() {
    initModule(MenuModule());
  });
}
