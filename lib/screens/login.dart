import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:arretadas/components/Input.dart';
import 'package:arretadas/components/Button.dart';
import 'package:arretadas/components/Form.dart';
import 'package:http/http.dart' as http;

User userFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromJson(jsonData);
}

class User {
  User({this.name, this.token});

  String name;
  String token;

  factory User.fromJson(Map<dynamic, dynamic> json) =>
      User(name: json["name"], token: json["token"]);
}

class Login extends StatelessWidget {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<dynamic> _checkUser(String name, String password) async {
    // final url = 'https://infinite-escarpment-35695.herokuapp.com/user/login';
    final url = 'http://10.0.2.2:3000/user/login';
    final response =
        await http.post(url, body: {"name": name, "password": password});

    return userFromJson(response.body);
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
                    callback: () {
                      _checkUser(nameController.text, passwordController.text)
                          .then((resp) {
                        print(resp);
                        if (resp != null) {
                          Navigator.pushNamed(context, '/menu');
                          return;
                        } else {
                          showModalBottomSheet<String>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 150.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0))),
                                    child: Center(
                                      child: Text(
                                        'Campos inválidos',
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
                      }).catchError((e) => print(e));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
