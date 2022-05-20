import 'package:arretadas/app/modules/register/domain/erros/erros.dart';
import 'package:arretadas/app/modules/register/domain/usecases/register_usecase.dart';
import 'package:arretadas/app/modules/register/infra/datasources/register_datasource.dart';
import 'package:dio/dio.dart';

import '../../../../../core/constants/api_endpoint.dart';

class RegisterApi implements RegisterDatasource {
  final Dio dio;

  RegisterApi(this.dio);

  @override
  Future<void> cadastrar(RegisterParams params) async {
    try {
      final response = await dio.post('${ApiEndpoint.urlProducao}/user', data: {
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
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw RegisterException("Sem conexão com a Internet");
      } else if (e.type == DioErrorType.other) {
        throw RegisterException("Sem conexão com a Internet");
      } else if (e.response?.statusCode == 500) {
        throw RegisterException("Usuário já cadastrado. Tente outro!");
      } else {
        throw RegisterException(e.message);
      }
    }
  }
}
