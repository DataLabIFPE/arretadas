import 'package:arretadas/components/Button.dart';
import 'package:flutter/material.dart';
import 'package:arretadas/components/Input.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Image.asset(
              'assets/Background.jpg',
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
                Input(color: Colors.white, labelText: 'Nome'),
                Input(color: Colors.white, labelText: 'Senha'),
                Input(color: Colors.white, labelText: 'Confirme sua Senha'),
                Input(color: Colors.white, labelText: 'Código de Proteção'),
                Button(
                  btnColor: Colors.white,
                  txtColor: Colors.redAccent,
                  labelText: 'CADASTRAR',
                  callback: () {
                    Navigator.pushNamed(context, '/menu');
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
