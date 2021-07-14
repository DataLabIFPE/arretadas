import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio();
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError));
  }

  Dio get instance => _dio;

  _onRequest(RequestOptions options) async {
    var prefs = await SharedPreferences.getInstance();
    var user = (prefs.getString('user') ?? "");
    var userMap = json.decode(user);
    var token = userMap['token'];
    options.headers['x-access-token'] = token;
    var tokenBearer = 'Bearer ' + token;
    options.headers['authorization'] = tokenBearer;
  }

  _onError(DioError e) {
    return e;
  }

  _onResponse(Response e) {
    print(e.data);
    return e;
  }
}
