import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(248,92,104,1),
        body: Column(
          children: <Widget>[
            Container(
              height: 350,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          alignment: Alignment.bottomCenter,
                          image: AssetImage("assets/women.png"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/arretadas-logo.png"),
                          alignment: Alignment.center,
                        ),
                      ),
                      height: 150,
                      margin: EdgeInsets.only(top: 10),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: TextField(
                scrollPadding: EdgeInsets.all(10.0),
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(top: 10),
            ),
            Container(
              child: TextField(
                scrollPadding: EdgeInsets.all(10.0),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(top: 10),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 10),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Container(
                height: 45,
                margin: EdgeInsets.symmetric(horizontal: 80),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(193, 66, 66, 1),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}