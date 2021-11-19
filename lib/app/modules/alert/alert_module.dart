import 'package:arretadas/app/modules/alert/alert_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'alert_page.dart';

class AlertModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AlertStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AlertPage()),
  ];
}
