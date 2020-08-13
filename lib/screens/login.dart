import 'package:flutter/material.dart';
import 'package:arretadas/components/Input.dart';

class Login extends StatelessWidget {
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
                Input(color: Colors.white, labelText: 'Nickname'),
                Input(color: Colors.white, labelText: 'Senha'),
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  height: 70.0,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.white,
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/menu');
                    },
                    child: Center(
                      child: Text(
                        'ENTRAR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color.fromRGBO(248, 92, 104, 1),
                        ),
                      ),
                    ),
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
