import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final List<Widget> fields;

  CustomForm({Key key, this.fields});

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.fields,
    );
  }
}
