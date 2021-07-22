import 'dart:convert';

class UserModel {
  String id;
  String nickname;
  String token;

  UserModel({
    this.id,
    this.nickname,
    this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nickname': nickname,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return UserModel(
      id: map['data']['id'],
      nickname: map['data']['nickname'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
