import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Image.asset(
              "assets/Background.jpg",
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
                Container(
                  margin: EdgeInsets.only(top: 150.0),
                  height: 70.0,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    border: Border.all(
                    color: Colors.white,
                    width: 1.0,
                    )
                  ),
                  child: FlatButton(
                    onPressed: () {},
                    child: Center(
                      child: Text(
                      'CADASTRAR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 100.0, top: 30.0),
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