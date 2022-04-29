import 'package:arretadas/app/modules/register/domain/erros/erros.dart';
import 'package:arretadas/app/modules/register/domain/usecases/register_usecase.dart';
import 'package:arretadas/app/modules/register/infra/datasources/register_datasource.dart';
import 'package:dio/dio.dart';

import '../../../../../core/constants/api_endpoint.dart';

class RegisterApi implements RegisterDatasource {
  final Dio dio;

  RegisterApi(this.dio);

  Future<void> cadastrar(RegisterParams params) async {
    try {
      final response =
          await this.dio.post('${ApiEndpoint.url_heroku}/user', data: {
        'nickname': params.nickname,
        'password': params.password,
        'indexQuestion': params.indexQuestion,
        'answerQuestion': params.answerQuestion,
        'city': params.city,
        'protection_code': params.protectionCode,
        'roles': params.roles
      });
      print(response.data);
    } on DioError catch (e) {
      throw RegisterException(e.message);
    }
  }
}
