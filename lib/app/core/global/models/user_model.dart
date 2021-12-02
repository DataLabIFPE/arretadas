class UserModel {
  final String nickname;
  final String password;
  final String city;
  final String? protectionCode;

  UserModel(
      {this.nickname = '',
      this.password = '',
      this.city = '',
      this.protectionCode});

  UserModel copyWith({
    String? nickname,
    String? password,
    String? city,
    String? protectionCode,
  }) {
    return UserModel(
      nickname: nickname ?? this.nickname,
      password: password ?? this.password,
      city: city ?? this.city,
      protectionCode: protectionCode ?? this.protectionCode,
    );
  }
}
