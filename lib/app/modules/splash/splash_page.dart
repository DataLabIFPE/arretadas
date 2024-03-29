import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:arretadas/app/modules/splash/splash_controller.dart';
import 'package:arretadas/app/modules/splash/splash_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class SplashPage extends StatefulWidget {
  final String title;

  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends ModularState<SplashPage, SplashStore> {
  @override
  final SplashStore store = Modular.get();
  late Disposer disposer;

  @override
  void initState() {
    super.initState();
    store.checkAuth();
    disposer = store.observer(onState: (state) {
      switch (state) {
        case UserLogged.authenticate:
          Modular.to.pushReplacementNamed('/menu');
          print(state);
          break;
        case UserLogged.unauthenticate:
          Modular.to.pushReplacementNamed('/home');
          print(state);
          break;
        default:
          break;
      }
    }, onError: (e) {
      print(e);
      Modular.to.pushReplacementNamed('/error');
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Image.asset("assets/icons/icon_white.png"),
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
