import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final double? width;
  final double? height;
  final void Function()? onPressed;
  final Color? buttonColor;
  final Widget child;
  final EdgeInsets? margin;

  const Button(
      {Key? key,
      this.width,
      this.height,
      this.onPressed,
      this.buttonColor,
      required this.child,
      this.margin})
      : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    final width = widget.width != null
        ? widget.width
        : (MediaQuery.of(context).size.width * 0.55);
    final height = widget.height != null ? widget.height : 50.0;
    final btnColor =
        widget.buttonColor != null ? widget.buttonColor : Colors.transparent;

    return Container(
      margin: widget.margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.white,
          )),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          primary: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }
}
