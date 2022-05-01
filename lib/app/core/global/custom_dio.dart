import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDio {
  final Dio client;

  CustomDio(this.client) {
    client.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError));
  }

  _onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var shared = await Modular.getAsync<SharedPreferences>();
    var user = (shared.getString('user') ?? "");
    var userM = json.decode(user);
    String token = userM['token'];
    options.headers['authorization'] = 'Bearer $token';
    options.connectTimeout = 20000;
  }

  void _onResponse(Response e, ResponseInterceptorHandler handler) {}

  void _onError(DioError e, ErrorInterceptorHandler handler) {}
}
