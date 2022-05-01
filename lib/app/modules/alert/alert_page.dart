import 'package:flutter/material.dart';

class AlertPage extends StatefulWidget {
  final String title;
  const AlertPage({Key? key, this.title = 'AlertPage'}) : super(key: key);
  @override
  AlertPageState createState() => AlertPageState();
}

class AlertPageState extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const <Widget>[],
      ),
    );
  }
}
