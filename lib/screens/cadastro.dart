/*import 'package:arretadas/components/Button.dart';
import 'package:arretadas/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:arretadas/components/Input.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// ignore: must_be_immutable
class Cadastro extends StatelessWidget {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var checkCreateUser;

  Future<dynamic> _createUser(String name, String password) async {
    final url = 'https://arretadas-api.herokuapp.com/user';
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "nickname": name,
          "password": password,
          "aleatory_questions": [],
          "roles": ["admin"]
        }));
    checkCreateUser = json.decode(response.body);
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
                  controller: passwordController,
                ),
                Input(
                  color: Colors.white,
                  labelText: 'Confirme sua Senha',
                  margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                  type: 'password',
                  controller: confirmPasswordController,
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
                  callback: () async {
                    if (passwordController.text ==
                        confirmPasswordController.text) {
                      var resp = await _createUser(
                          nameController.text, passwordController.text);
                      print(resp["message"]);
                      print(checkCreateUser["message"]);
                      print(resp["message"] == checkCreateUser["message"]);
                      if (resp["message"] == checkCreateUser["message"]) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Menu(
                                name: nameController.text,
                              ),
                            ));
                        return;
                      }
                      return;
                    }
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
                                  'Senhas Divergentes!',
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
*/