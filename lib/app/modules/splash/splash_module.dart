import 'package:arretadas/app/modules/splash/splash_controller.dart';
import 'package:arretadas/app/modules/splash/splash_page.dart';
import 'package:arretadas/app/modules/splash/splash_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashStore()),
    Bind((i) => SplashController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
  ];
}
