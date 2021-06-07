class RegisterInputModel {
  String nickname;
  String password;
  // ignore: non_constant_identifier_names
  var aleatory_questions = [];
  var roles = [];
  RegisterInputModel({
    this.nickname,
    this.password,
    // ignore: non_constant_identifier_names
    this.aleatory_questions,
    this.roles,
  });
}
