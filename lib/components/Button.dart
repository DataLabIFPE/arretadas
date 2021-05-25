import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  Button(
      {Key key,
      this.margin,
      this.width,
      this.height,
      this.txtColor,
      this.btnColor,
      this.child,
      this.fontSize,
      this.callback,
      this.fontWeight})
      : super(key: key);

  final EdgeInsets margin;
  final double width;
  final double height;
  final Color txtColor;
  final Color btnColor;
  final Widget child;
  final double fontSize;
  final Function callback;
  final FontWeight fontWeight;
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    final bgColor =
        widget.btnColor != null ? widget.btnColor : Colors.transparent;
    final width = widget.width != null
        ? widget.width
        : (MediaQuery.of(context).size.width * 0.55);
    final height = widget.height != null ? widget.height : 50.0;

    return Container(
      margin: widget.margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: bgColor,
          border: Border.all(
            color: Colors.white,
          )),
      child: TextButton(
        onPressed: widget.callback,
        child: Center(
          child: widget.child,
        ),
      ),
    );
  }
}
