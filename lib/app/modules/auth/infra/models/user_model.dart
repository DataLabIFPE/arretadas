// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:arretadas/app/modules/auth/domain/entities/user.dart';

class UserModel extends User {
  final String id;
  final String nickname;
  final String? protectionCode;
  final String token;

  UserModel(
      {required this.id,
      required this.nickname,
      this.protectionCode,
      required this.token});

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nickname': nickname,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['data']['id'],
      nickname: map['data']['nickname'],
      token: map['token'],
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
