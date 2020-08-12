import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  Input({this.color, this.labelText});

  final Color color;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        scrollPadding: EdgeInsets.all(10.0),
        style: TextStyle(
          color: color,
        ),
        obscureText: false,
        decoration: InputDecoration(
            labelText: '$labelText',
            labelStyle: TextStyle(
              color: color,
            )),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: 10),
    );
  }
}
