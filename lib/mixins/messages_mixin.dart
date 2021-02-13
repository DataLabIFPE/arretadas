import 'package:flutter/material.dart';

abstract class MessagesMixin {
  final scaffoldGlobalKey = GlobalKey<ScaffoldState>();

  showError(
          {@required String message,
          BuildContext context,
          GlobalKey<ScaffoldState> key}) =>
      _showSnackBar(
          context: context, color: Colors.red, message: message, key: key);

  showSuccess(
          {@required String message,
          BuildContext context,
          GlobalKey<ScaffoldState> key}) =>
      _showSnackBar(
          context: context, color: Colors.blue, message: message, key: key);

  void _showSnackBar(
      {BuildContext context,
      String message,
      GlobalKey<ScaffoldState> key,
      Color color}) {
    final snackbar = SnackBar(backgroundColor: color, content: Text(message));

    if (key != null) {
      key.currentState.showSnackBar(snackbar);
    } else {
      Scaffold.of(context).showSnackBar(snackbar);
    }
  }
}
