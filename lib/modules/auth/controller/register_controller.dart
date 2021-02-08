import 'package:arretadas/exceptions/rest_exception.dart';
import 'package:arretadas/repositories/auth_repository.dart';
import 'package:arretadas/view_models/register_input_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends ChangeNotifier {
  bool loading;
  bool registerSuccess;
  String error;
  final AuthRepository _repository = AuthRepository();

  Future<void> registerUser(String nickname, String password) async {
    loading = true;
    registerSuccess = false;
    notifyListeners();
    final inputModel = RegisterInputModel(
        nickname: nickname,
        password: password,
        aleatory_questions: [],
        roles: ['user']);

    try {
      await _repository.saveUser(inputModel);
      registerSuccess = true;
    } on RestException catch (e) {
      registerSuccess = false;
      error = e.message;
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
