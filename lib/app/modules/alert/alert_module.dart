import 'package:flutter_modular/flutter_modular.dart';

import 'alert_page.dart';

class AlertModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AlertPage()),
  ];
}
