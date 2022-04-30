import 'dart:convert';

class User {
  final String? id;
  final String? nickname;

  User({
    this.id,
    this.nickname,
  });

  factory User.empty() => User();

  @override
  String toString() {
    return 'ID $id\n' + 'NICKNAME: $nickname\n';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nickname': nickname,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['data']['id'],
      nickname: map['data']['nickname'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
