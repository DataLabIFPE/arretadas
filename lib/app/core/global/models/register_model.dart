class RegisterModel {
  final String nickname;
  final String password;
  final String city;
  final int indexQuestion;
  final String answerQuestion;
  final String? protectionCode;
  final List? roles;

  RegisterModel({
    this.answerQuestion = '',
    this.indexQuestion = 1,
    this.nickname = '',
    this.password = '',
    this.city = '',
    this.protectionCode = '',
    this.roles = const ['user'],
  });

  RegisterModel copyWith({
    String? nickname,
    String? password,
    String? city,
    int? indexQuestion,
    String? answerQuestion,
    String? protectionCode,
    List? roles,
  }) {
    return RegisterModel(
        nickname: nickname ?? this.nickname,
        password: password ?? this.password,
        city: city ?? this.city,
        indexQuestion: indexQuestion ?? this.indexQuestion,
        protectionCode: protectionCode ?? this.protectionCode,
        answerQuestion: answerQuestion ?? this.answerQuestion,
        roles: roles ?? this.roles);
  }

  @override
  String toString() {
    return nickname +
        "\n" +
        password +
        "\n" +
        protectionCode.toString() +
        "\n" +
        roles.toString() +
        "\n" +
        indexQuestion.toString() +
        "\n" +
        city.toString() +
        "\n" +
        answerQuestion.toString();
  }
}
