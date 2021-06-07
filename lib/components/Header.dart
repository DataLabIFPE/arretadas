import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  Header({
    Key key,
    this.userName,
  });
  final String userName;

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'Arretadas',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Exo',
            ),
          ),
        ),
      ],
    );
  }
}
