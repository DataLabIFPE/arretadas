import 'dart:convert';

import 'package:arretadas/app/modules/auth/domain/entities/user.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'splash_repository.dart';

enum UserLogged { inative, authenticate, unauthenticate }

class SplashController {
  late UserLogged logged;
  late SplashRepository repository;

  Future<UserLogged> call() async {
    final sp = await SharedPreferences.getInstance();
    if (sp.containsKey('user')) {
      refreshToken(sp);
      logged = UserLogged.authenticate;
    } else {
      logged = UserLogged.unauthenticate;
    }
    return logged;
  }

  Future<void> refreshToken(SharedPreferences sp) async {
    String t = sp.get('user').toString();
    final jso = json.decode(t);
    String id = jso['id'];
    String nickname = jso['nickname'];
    String token = jso['token'];
    repository = SplashRepository(Dio());
    final u = await repository.refreshToken(
      User(id: id, nickname: nickname, token: token),
    );
    sp.setString('user', u.toJson());
  }
}
