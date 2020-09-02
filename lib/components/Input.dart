import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final Color color;
  final String labelText;
  final String type;
  final TextEditingController controller;

  Input({Key key, this.type, this.color, this.labelText, this.controller});
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: widget.controller,
        scrollPadding: EdgeInsets.all(10.0),
        style: TextStyle(
          color: widget.color,
        ),
        obscureText: widget.type == 'password' ? true : false,
        decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: TextStyle(
              color: widget.color,
            )),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: 10),
    );
  }
}
