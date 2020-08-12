import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  Button(
      {Key key,
      this.txtColor,
      this.btnColor,
      this.context,
      this.rota,
      this.labelText})
      : super(key: key);

  final Color txtColor;
  final Color btnColor;
  final String rota;
  final String labelText;
  final BuildContext context;
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      height: 70.0,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: widget.txtColor,
      ),
      child: FlatButton(
        onPressed: () {
          Navigator.pushNamed(widget.context, widget.rota);
        },
        child: Center(
          child: Text(
            widget.labelText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              color: widget.btnColor,
            ),
          ),
        ),
      ),
    );
  }
}
