import 'dart:convert';

import 'package:arretadas/app/modules/auth/domain/entities/user.dart';
import 'package:arretadas/app/modules/complaints/presenter/pages/controller/controller_city.dart';
import 'package:arretadas/app/modules/splash/splash_exception.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'splash_repository.dart';

enum UserLogged { inative, authenticate, unauthenticate }

class SplashController {
  late UserLogged logged;
  late SplashRepository repository;

  Future<UserLogged> call() async {
    final user = await refreshToken();

    if (user.id != null) {
      logged = UserLogged.authenticate;
    }
    return logged;
  }

  Future<User> refreshToken() async {
    final sp = await SharedPreferences.getInstance();
    String t = sp.get('user').toString();
    final jso = json.decode(t);

    if (jso == null) {
      logged = UserLogged.unauthenticate;
      return User.empty();
    }

    String id = jso['id'];
    String nickname = jso['nickname'];
    String token = jso['token'];

    repository = SplashRepository(Dio());
    try {
      final user = await repository.refreshToken(
        User(id: id, nickname: nickname, token: token),
      );
      if (user.city != null) {
        ControllerCity().setCity(user.city as String);
      }
      sp.setString('user', user.toJson());
      return user;
    } on SplashException catch (e) {
      throw SplashException(e.message);
    }
  }
}
