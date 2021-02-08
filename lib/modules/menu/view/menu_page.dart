import 'package:flutter/material.dart';
import 'package:arretadas/modules/menu/controller/menu_controller.dart';

class MenuPage extends StatelessWidget {
  static const router = '/menu';

   @override
   Widget build(BuildContext context) {
       return ChangeNotifierProvider(
         create: (_) => MenuController(),
         child: MenuContent(),
       );
       
  }
}

class MenuContent extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Container(),
       );
  }
}