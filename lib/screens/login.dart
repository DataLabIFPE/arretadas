import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  
  Widget criaCampo(Color color, String labelText, bool obscure){
    return Container(
      child: TextField(
        scrollPadding: EdgeInsets.all(10.0),
        style: TextStyle(
          color: color,
        ),
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: '$labelText',
          labelStyle: TextStyle(
            color: color,
          )
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: 10),
    );
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
                criaCampo(Colors.white, 'Nickname', false),
                criaCampo(Colors.white, 'Senha', true),
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