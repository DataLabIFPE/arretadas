import 'package:flutter_modular/flutter_modular.dart';
import 'package:arretadas/app/modules/alert/alert_store.dart';
import 'package:flutter/material.dart';

class AlertPage extends StatefulWidget {
  final String title;
  const AlertPage({Key? key, this.title = 'AlertPage'}) : super(key: key);
  @override
  AlertPageState createState() => AlertPageState();
}
class AlertPageState extends State<AlertPage> {
  final AlertStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}