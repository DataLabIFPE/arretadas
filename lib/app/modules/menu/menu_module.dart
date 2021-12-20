import 'package:arretadas/app/modules/menu/menu_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'menu_page.dart';

class MenuModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MenuStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const MenuPage()),
  ];
}
