class UserModel {
  final String nickname;
  final String password;
  final String? protectionCode;

  UserModel({this.nickname = '', this.password = '', this.protectionCode});

  UserModel copyWith({
    String? nickname,
    String? password,
    String? protectionCode,
  }) {
    return UserModel(
      nickname: nickname ?? this.nickname,
      password: password ?? this.password,
      protectionCode: protectionCode ?? this.protectionCode,
    );
  }
}
