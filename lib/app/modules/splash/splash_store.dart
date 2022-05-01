import 'package:arretadas/app/modules/splash/splash_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class SplashStore extends NotifierStore<Exception, UserLogged> {
  final controller = Modular.get<SplashController>();

  SplashStore() : super(UserLogged.inative);

  Future<void> checkAuth() async {
    execute(() => controller.call(), delay: const Duration(seconds: 3));
  }
}
