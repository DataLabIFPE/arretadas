import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ControllerCity {
  static final ControllerCity _singleton = ControllerCity._internal();
  String _city = '';

  factory ControllerCity() {
    return _singleton;
  }

  void setCity(String city) {
    _city = city;
  }

  Future<String> getCity() async {
    final sp = await SharedPreferences.getInstance();
    final response = sp.get('user').toString();
    final user = json.decode(response);
    String? aux = user['city'];
    aux == null ? '' : _city = aux;
    return _city;
  }

  ControllerCity._internal();
}
