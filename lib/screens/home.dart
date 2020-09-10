import 'package:arretadas/components/Button.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Image.asset(
              "assets/Background.jpg",
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage('assets/logo-white.png'),
                        ),
                      ],
                    ),
                  ],
                ),
                Button(
                  labelText: 'CADASTRAR',
                  margin: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.height * 0.2),
                      bottom: (MediaQuery.of(context).size.height * 0.03)),
                  callback: () {
                    Navigator.pushNamed(context, '/cadastro');
                  },
                ),
                Button(
                  txtColor: Colors.redAccent,
                  btnColor: Colors.white,
                  labelText: 'ENTRAR',
                  callback: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
