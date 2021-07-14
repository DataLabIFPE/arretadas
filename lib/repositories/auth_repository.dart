import 'package:arretadas/exceptions/rest_exception.dart';
import 'package:arretadas/models/user_model.dart';
import 'package:arretadas/view_models/register_input_model.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  Future<UserModel> login(String nickname, String password) async {
    try {
      final response = await Dio().post(
          'https://arretadas-api.herokuapp.com/user/authenticate',
          data: {'nickname': nickname, 'password': password});
      return UserModel.fromMap(response.data);
    } on DioError catch (e) {
      print(e);
      String message = 'Erro ao autenticar usuário';
      if (e?.response?.statusCode == 404) {
        message = 'Usuario ou senha inválidos';
      }

      throw RestException(message);
    }
  }

  Future<void> saveUser(RegisterInputModel registerInputModel) async {
    try {
      await Dio().post('https://arretadas-api.herokuapp.com/user', data: {
        'nickname': registerInputModel.nickname,
        'password': registerInputModel.password,
        'aleatory_questions': registerInputModel.aleatory_questions,
        'roles': registerInputModel.roles
      });
      print('sucesso!');
    } on DioError catch (e) {
      print(e);
      throw RestException('Erro ao registrar usuário');
    }
  }
}
