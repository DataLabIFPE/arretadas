import 'dart:convert';

class User {
  final String? id;
  final String? token;
  final String? nickname;
  final String? protectionCode;

  User({
    this.id,
    this.token,
    this.nickname,
    this.protectionCode,
  });

  factory User.empty() => User();

  @override
  String toString() {
    return 'ID $id\n' +
        'NICKNAME: $nickname\n' +
        //'MEDIDA PROTETIVA: $protectionCode' +
        'TOKEN: $token';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nickname': nickname,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['data']['id'],
      nickname: map['data']['nickname'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
