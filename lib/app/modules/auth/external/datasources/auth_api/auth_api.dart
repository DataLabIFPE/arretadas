import 'package:arretadas/app/core/constants/api_endpoint.dart';
import 'package:arretadas/app/modules/auth/domain/entities/user.dart';
import 'package:arretadas/app/modules/auth/domain/erros/erros.dart';
import 'package:arretadas/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:arretadas/app/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:arretadas/app/modules/complaints/presenter/pages/controller/controller_city.dart';
import 'package:dio/dio.dart';

import 'mapper.dart';

class AuthApi implements AuthDatasource {
  final Dio dio;

  AuthApi(this.dio);

  @override
  Future<User> login(CredentialsParams params) async {
    dio.options.connectTimeout = 5000;
    try {
      final response = await dio.post(
          '${ApiEndpoint.urlHeroku}/user/authenticate',
          data: {'nickname': params.nickname, 'password': params.password});
      if (response.data['data']['city'] != null) {
        ControllerCity().setCity(response.data['data']['city']);
      }
      return UserMapper.fromJson(response.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw AuthException("Sem conexão com a Internet");
      } else if (e.type == DioErrorType.other) {
        throw AuthException("Sem conexão com a Internet");
      } else if (e.response?.statusCode == 404) {
        throw (AuthException("Usuário ou senha inválidos"));
      } else {
        throw AuthException(e.message);
      }
    }
  }
}
