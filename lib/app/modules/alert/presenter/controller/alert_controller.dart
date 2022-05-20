import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AlertController {
  Future<String> getUserId() async {
    final sp = await SharedPreferences.getInstance();
    final response = sp.get('user').toString();
    final user = json.decode(response);
    return user['id'];
  }

  Future<String> getToken() async {
    final sp = await SharedPreferences.getInstance();
    final response = sp.get('user').toString();
    final user = json.decode(response);
    return user['token'];
  }
}
