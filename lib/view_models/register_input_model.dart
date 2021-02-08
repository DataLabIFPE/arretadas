class RegisterInputModel {
  String nickname;
  String password;
  var aleatory_questions = new List();
  var roles = new List();
  RegisterInputModel({
    this.nickname,
    this.password,
    this.aleatory_questions,
    this.roles,
  });
}
