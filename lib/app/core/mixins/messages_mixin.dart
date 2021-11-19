import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

abstract class MessagesMixin {
  final scaffoldGlobalKey = GlobalKey<ScaffoldState>();

  void showSnackbar(BuildContext context, Object? error) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        error.toString(),
        style: TextStyle(color: AppColors.primaryColorAccent, fontSize: 15),
        textAlign: TextAlign.center,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showSucess(BuildContext context, Object? state) {
    final snackBar = SnackBar(
      backgroundColor: Colors.blue,
      behavior: SnackBarBehavior.floating,
      content: Text(
        state.toString(),
        style: TextStyle(color: AppColors.primaryColorAccent, fontSize: 15),
        textAlign: TextAlign.center,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
