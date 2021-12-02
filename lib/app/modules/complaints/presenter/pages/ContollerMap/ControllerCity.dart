import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ControllerCity {
  static final ControllerCity _singleton = ControllerCity._internal();
  String _city = '';

  factory ControllerCity() {
    return _singleton;
  }

  void setCity(String city) {
    this._city = city;
  }

  String getCity() {
    return this._city;
  }

  ControllerCity._internal();
}
