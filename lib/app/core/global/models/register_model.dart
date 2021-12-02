class RegisterModel {
  final String nickname;
  final String password;
  final String city;
  final List? aleatoryQuestions;
  final String? protectionCode;
  final List? roles;

  RegisterModel({
    this.nickname = '',
    this.password = '',
    this.city = '',
    this.aleatoryQuestions = const [],
    this.protectionCode = '',
    this.roles = const ['user'],
  });

  RegisterModel copyWith({
    String? nickname,
    String? password,
    String? city,
    List? aleatoryQuestions,
    String? protectionCode,
    List? roles,
  }) {
    return RegisterModel(
        nickname: nickname ?? this.nickname,
        password: password ?? this.password,
        city: city ?? this.city,
        protectionCode: protectionCode ?? this.protectionCode,
        aleatoryQuestions: aleatoryQuestions ?? this.aleatoryQuestions,
        roles: roles ?? this.roles);
  }
}
