import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier {
  late bool isAccepted;

  RegisterController() {
    isAccepted = false;
  }

  Future<void> changeAcceptTerms(bool value) async {
    isAccepted = value;
    notifyListeners();
  }
}
