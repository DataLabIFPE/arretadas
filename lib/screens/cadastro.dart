import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {

  Widget criaBotao(Color color, String rota, String labelText, Color background, context){
    return Container(
                  margin: EdgeInsets.only(top: 50.0),
                  height: 70.0,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: color,
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/$rota');
                    },
                    child: Center(
                      child: Text(
                      '$labelText',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: background,
                      ),
                      ),
                    ),
                  ),
                );
  }

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
                criaCampo(Colors.white, 'Confirme sua Senha', true),
                criaCampo(Colors.white, 'Código de Proteção', false),
                criaBotao(Colors.white, 'menu', 'CADASTRAR', Color.fromRGBO(248, 92, 104, 1), context)
              ],
            ),
          ],
        ),
      ),      
    );
  }
}