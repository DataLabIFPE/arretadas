import 'package:flutter/material.dart';

import 'package:arretadas/modules/splash/view/splash_page.dart';
import 'package:arretadas/screens/menu.dart';
import 'package:arretadas/screens/info/info.dart';
import 'package:arretadas/UIcontacts/HomeContactsPage.dart';
import 'package:arretadas/screens/mapa.dart';

import 'package:arretadas/modules/auth/view/home_page.dart';
import 'package:arretadas/modules/auth/view/login_page.dart';
import 'package:arretadas/modules/auth/view/register_page.dart';

//import 'package:arretadas/screens/denuncias.dart';
//import 'package:arretadas/screens/cadastro.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arretadas',
      initialRoute: SplashPage.router,
      routes: {
        '/menu': (context) => Menu(),
        '/info': (context) => Info(),
        '/contacts': (context) => HomeContactsPage(),
        '/mapa': (context) => SetMap(),
        '/denuncias': (context) => Map(),
        '/map': (context) => Map(),

        //'/cadastro': (context) => Cadastro(),
        //'/login': (context) => Login(),
        //'/denuncias': (context) => Denuncias(),

        //novas rotas
        SplashPage.router: (_) => SplashPage(),
        HomePage.router: (_) => HomePage(),
        LoginPage.router: (_) => LoginPage(),
        RegisterPage.router: (_) => RegisterPage(),
      },
    );
  }
}
