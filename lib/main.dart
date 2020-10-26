import 'package:flutter/material.dart';
import 'package:arretadas/screens/menu.dart';
import 'package:arretadas/screens/login.dart';
import 'package:arretadas/screens/home.dart';
import 'package:arretadas/screens/info/info.dart';
import 'package:arretadas/screens/cadastro.dart';
import 'package:arretadas/UIcontacts/HomeContactsPage.dart';
// import 'package:arretadas/screens/denuncias.dart';
import 'package:arretadas/screens/mapa.dart';

void main() {
  runApp(MaterialApp(
    title: 'Routes',
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/menu': (context) => Menu(),
      '/cadastro': (context) => Cadastro(),
      '/info': (context) => Info(),
      '/login': (context) => Login(),
      '/contacts': (context) => HomeContactsPage(),

      '/denuncias': (context) => Denuncias(),
      '/mapa': (context) => SetMap(),

      '/denuncias': (context) => Map(),
      '/map': (context) => Map(),

    },
  ));
}

