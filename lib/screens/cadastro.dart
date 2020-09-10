import 'package:arretadas/components/Button.dart';
import 'package:arretadas/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:arretadas/components/Input.dart';

class Cadastro extends StatelessWidget {
  final nameController = TextEditingController();
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
                Input(
                  color: Colors.white,
                  labelText: 'Nome',
                  margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  controller: nameController,
                ),
                Input(
                  color: Colors.white,
                  labelText: 'Senha',
                  margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                  type: 'password',
                ),
                Input(
                  color: Colors.white,
                  labelText: 'Confirme sua Senha',
                  margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                  type: 'password',
                ),
                Input(
                  color: Colors.white,
                  labelText: 'Código de Proteção (OPCIONAL)',
                  margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                ),
                Button(
                  btnColor: Colors.white,
                  txtColor: Colors.redAccent,
                  margin: EdgeInsets.only(top: 30.0),
                  child: Text(
                    'CADASTRAR',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  callback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Menu(
                            name: nameController.text,
                          ),
                        ));
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
