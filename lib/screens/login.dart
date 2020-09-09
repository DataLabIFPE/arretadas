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
                        controller: emailController,
                        type: 'username',
                        color: Colors.white,
                        labelText: 'Nickname'),
                    Input(
                        controller: passwordController,
                        type: 'password',
                        color: Colors.white,
                        labelText: 'Senha'),
                  ],
                ),
                Button(
                  email: emailController.text,
                  password: passwordController.text,
                  txtColor: Colors.redAccent,
                  btnColor: Colors.white,
                  labelText: 'LOGIN',
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
