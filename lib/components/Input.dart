import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final Color color;
  final String labelText;
  final String type;
  final TextEditingController controller;
  final EdgeInsets margin;
  final Icon suffixIcon;
  final Function suffixIconOnPressed;
  final bool obscureText;
  final FormFieldValidator validator;

  Input(
      {Key key,
      this.type,
      this.color,
      this.labelText,
      this.controller,
      this.margin,
      this.suffixIcon,
      this.suffixIconOnPressed,
      this.obscureText = false,
      this.validator});
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          scrollPadding: EdgeInsets.all(10.0),
          style: TextStyle(
            color: widget.color,
          ),
          obscureText: widget.obscureText,
          decoration: InputDecoration(
              suffixIcon: widget.suffixIcon != null
                  ? IconButton(
                      icon: widget.suffixIcon,
                      onPressed: widget.suffixIconOnPressed,
                    )
                  : null,
              labelText: widget.labelText,
              labelStyle: TextStyle(
                color: widget.color,
              )),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        margin: widget.margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.white),
        ));
  }
}
