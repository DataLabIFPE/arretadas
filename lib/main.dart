import 'package:arretadas/modules/splash/view/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:arretadas/screens/menu.dart';
import 'package:arretadas/screens/info/info.dart';
import 'package:arretadas/screens/cadastro.dart';
import 'package:arretadas/UIcontacts/HomeContactsPage.dart';
// import 'package:arretadas/screens/denuncias.dart';
import 'package:arretadas/screens/mapa.dart';

import 'package:arretadas/modules/auth/view/home_page.dart';
import 'package:arretadas/modules/auth/view/login_page.dart';
import 'package:arretadas/modules/auth/view/register_page.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arretadas',
      initialRoute: SplashPage.router,
      routes: {
        '/menu': (context) => Menu(),
        '/cadastro': (context) => Cadastro(),
        '/info': (context) => Info(),
        //'/login': (context) => Login(),
        '/contacts': (context) => HomeContactsPage(),

        //'/denuncias': (context) => Denuncias(),
        '/mapa': (context) => SetMap(),

        '/denuncias': (context) => Map(),
        '/map': (context) => Map(),

        //novas rotas
        SplashPage.router: (_) => SplashPage(),
        HomePage.router: (_) => HomePage(),
        LoginPage.router: (_) => LoginPage(),
        RegisterPage.router: (_) => RegisterPage(),
      },
    );
  }
}
