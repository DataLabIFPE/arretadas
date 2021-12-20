import 'package:arretadas/app/core/constants/app_colors.dart';

import 'package:flutter/material.dart';

class TextCustom extends StatefulWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final String? fontFamily;
  const TextCustom(
      {Key? key,
      required this.text,
      this.fontSize,
      this.color,
      this.fontFamily})
      : super(key: key);

  @override
  _TextCustomState createState() => _TextCustomState();
}

class _TextCustomState extends State<TextCustom> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text.toUpperCase(),
      style: TextStyle(
          color: widget.color == null
              ? AppColors.primaryColorAccent
              : widget.color,
          fontWeight: FontWeight.bold,
          fontSize: widget.fontSize == null ? 15.0 : widget.fontSize,
          fontFamily: widget.fontFamily == null ? 'Roboto' : widget.fontFamily),
    );
  }
}
