import 'package:flutter/material.dart';
import 'package:arretadas/screens/menu.dart';
import 'package:arretadas/screens/login.dart';
import 'package:arretadas/screens/home.dart';
import 'package:arretadas/screens/info.dart';

void main() {
  runApp(MaterialApp(
    title: 'Routes',
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/menu': (context) => Menu(),
      '/info' : (context) => Info(),
      '/login' : (context) => Login(),
    },
  ));
}
