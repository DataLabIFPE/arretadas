import 'package:arretadas/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:arretadas/components/Input.dart';
import 'package:arretadas/components/Button.dart';
import 'package:arretadas/components/Form.dart';

class Login extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                CustomForm(
                  fields: <Widget>[
                    Input(
                        margin:
                            EdgeInsets.only(top: 60.0, left: 10.0, right: 10.0),
                        controller: emailController,
                        type: 'username',
                        color: Colors.white,
                        labelText: 'Nickname'),
                    Input(
                        margin:
                            EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                        controller: passwordController,
                        type: 'password',
                        color: Colors.white,
                        labelText: 'Senha'),
                  ],
                ),
                Button(
                  txtColor: Colors.redAccent,
                  btnColor: Colors.white,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1),
                  child: Text(
                    'ENTRAR',
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
                            builder: (context) =>
                                Menu(name: emailController.text)));
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
