import 'package:arretadas/app/modules/auth/auth_module.dart';
import 'package:arretadas/app/modules/complaints/complaints_module.dart';
import 'package:arretadas/app/modules/friendcontacts/friendcontacts_module.dart';
import 'package:arretadas/app/modules/info/info_module.dart';
import 'package:arretadas/app/modules/splash/splash_module.dart';
import 'package:arretadas/app/modules/usefulcontacts/usefulcontacts_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/pages/not_found_page.dart';
import 'modules/home/home_module.dart';
import 'modules/menu/menu_module.dart';
import 'modules/register/register_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [AsyncBind((i) => SharedPreferences.getInstance())];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/auth', module: AuthModule()),
    ModuleRoute('/register', module: RegisterModule()),
    ModuleRoute('/menu', module: MenuModule()),
    ModuleRoute('/info', module: InfoModule()),
    ModuleRoute('/complaints', module: ComplaintsModule()),
    ModuleRoute('/usefulcontacts', module: UsefulcontactsModule()),
    ModuleRoute('/friendcontacts', module: FriendcontactsModule()),
    WildcardRoute(child: (context, args) => const NotFoundPage()),
  ];
}
