import 'package:arretadas/app/core/components/button.dart';
import 'package:arretadas/app/core/components/text_custom.dart';
import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:arretadas/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset(
                "assets/icons/icon_white_shadow.png",
              ),
            ),
            Column(
              children: [
                Button(
                    onPressed: () => Modular.to.pushNamed('/register'),
                    child: TextCustom(text: 'cadastrar')),
                SizedBox(
                  height: 10,
                ),
                Button(
                    onPressed: () => Modular.to.pushNamed('/auth'),
                    buttonColor: AppColors.primaryColorAccent,
                    child: TextCustom(
                      text: 'entrar',
                      color: AppColors.primaryColor,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
