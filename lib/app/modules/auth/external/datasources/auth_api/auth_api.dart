import 'package:arretadas/app/modules/auth/domain/entities/user.dart';
import 'package:arretadas/app/modules/auth/domain/erros/erros.dart';
import 'package:arretadas/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:arretadas/app/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:arretadas/app/modules/complaints/presenter/pages/ContollerMap/controller_city.dart';
import 'package:dio/dio.dart';

import 'mapper.dart';

class AuthApi implements AuthDatasource {
  final Dio dio;

  AuthApi(this.dio);

  @override
  Future<User> login(CredentialsParams params) async {
    try {
      final response = await dio.post(
          'https://arretadas-api.herokuapp.com/user/authenticate',
          data: {'nickname': params.nickname, 'password': params.password});
      if (response.data['data']['city'] != null) {
        ControllerCity().setCity(response.data['data']['city']);
      }

      return UserMapper.fromJson(response.data);
    } on DioError catch (e) {
      throw AuthException(e.message);
    }
  }
}
