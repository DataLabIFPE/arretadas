import 'package:arretadas/modules/complaints/view/complaints_page.dart';
import 'package:arretadas/modules/friendcontacts/view/friendcontacts_page.dart';
import 'package:arretadas/modules/map/view/map2_page.dart';
import 'package:arretadas/modules/map/view/map_page.dart';
import 'package:arretadas/modules/menu/view/menu_page.dart';
import 'package:flutter/material.dart';

import 'package:arretadas/modules/splash/view/splash_page.dart';
import 'package:arretadas/screens/info/info.dart';

import 'package:arretadas/modules/auth/view/home_page.dart';
import 'package:arretadas/modules/auth/view/login_page.dart';
import 'package:arretadas/modules/auth/view/register_page.dart';
import 'package:arretadas/modules/usefulcontacts/view/usefulcontacts_page.dart';

import 'package:arretadas/core/app_colors.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      title: 'Arretadas',
      theme: ThemeData(
        primaryColor: AppColors.primaria,
        accentColor: AppColors.secundaria,
      ),
      initialRoute: SplashPage.router,
      routes: {
        '/info': (context) => Info(),

        //novas rotas
        SplashPage.router: (_) => SplashPage(),
        HomePage.router: (_) => HomePage(),
        LoginPage.router: (_) => LoginPage(),
        RegisterPage.router: (_) => RegisterPage(),
        UsefulcontactsPage.router: (_) => UsefulcontactsPage(),
        ComplaintsPage.router: (_) => ComplaintsPage(),
        MapPage.router: (_) => MapPage(),
        MenuPage.router: (_) => MenuPage(),
        Map2Page.router: (_) => Map2Page(),
        FriendContactsPage.router: (_) => FriendContactsPage(),
        //'/contacts': (context) => HomeContactsPage(),
      },
    );
  }
}
