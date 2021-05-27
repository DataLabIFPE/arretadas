class RegisterInputModel {
  String nickname;
  String password;
  var aleatory_questions = [];
  var roles = [];
  RegisterInputModel({
    this.nickname,
    this.password,
    this.aleatory_questions,
    this.roles,
  });
}
