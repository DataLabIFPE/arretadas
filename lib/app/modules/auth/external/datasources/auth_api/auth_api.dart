import 'package:arretadas/app/core/constants/api_endpoint.dart';
import 'package:arretadas/app/modules/auth/domain/entities/user.dart';
import 'package:arretadas/app/modules/auth/domain/erros/erros.dart';
import 'package:arretadas/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:arretadas/app/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:arretadas/app/modules/complaints/presenter/pages/ContollerMap/ControllerCity.dart';
import 'package:dio/dio.dart';

import 'mapper.dart';

class AuthApi implements AuthDatasource {
  final Dio dio;

  AuthApi(this.dio);

  @override
  Future<User> login(CredentialsParams params) async {
    try {
      final response = await this.dio.post(
          '${ApiEndpoint.url_heroku}/user/authenticate',
          data: {'nickname': params.nickname, 'password': params.password});
      if (response.data['data']['city'] != null) {
        ControllerCity().setCity(response.data['data']['city']);
      }

      return UserMapper.fromJson(response.data);
    } on DioError catch (e) {
      throw AuthException(e.message);
    }
  }

  /*Future<void> verifyQuestions() async {
    try {
      final response = await this
          .dio
          .post('${ApiEndpoint.url_heroku}/user/recover-questions', data: {
            'nickname': ,
            'indexQuestion': ,
            'answerQuestion': ,
          });
    } on DioError catch (e) {
      throw AuthException(e.message);
    }
  }*/
}
