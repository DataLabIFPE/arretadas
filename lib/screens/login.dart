import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:arretadas/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:arretadas/components/Input.dart';
import 'package:arretadas/components/Button.dart';
import 'package:arretadas/components/Form.dart';

Future<String> showModal(BuildContext context, String error) {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150.0,
          child: Container(
            child: Center(
              child: Text(
                error,
                style: TextStyle(
                  fontFamily: 'Exo',
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      });
}

class Login extends StatelessWidget {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<Map<String, dynamic>> _checkUser(String name, String password) async {
    final url = 'https://arretadas-api.herokuapp.com/user/authenticate';
    final response =
        await http.post(url, body: {"nickname": name, "password": password});

    if (password == '') {
      print('password em branco');
      return json.decode(response.body);
    }

    return json.decode(response.body);
  }

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
                        controller: nameController,
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
                    callback: () async {
                      Map<String, dynamic> resp = await _checkUser(
                          nameController.text, passwordController.text);
                      if (resp['error'] == 'senha inválida') {
                        showModal(context, resp['error']);
                      }

                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Menu(
                            name: resp['data']['nickname'],
                          );
                        },
                      ));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
