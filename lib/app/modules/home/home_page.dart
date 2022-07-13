import 'package:arretadas/app/core/components/button.dart';
import 'package:arretadas/app/core/components/text_custom.dart';
import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset(
                "assets/icons/icon_white_shadow.png",
              ),
            ),
            Column(
              children: [
                Button(
                  onPressed: () => Modular.to.pushNamed('/register'),
                  child: const TextCustom(text: 'cadastrar'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Button(
                  onPressed: () => Modular.to.pushNamed('/auth'),
                  buttonColor: AppColors.primaryColorAccent,
                  child: const TextCustom(
                    text: 'entrar',
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
