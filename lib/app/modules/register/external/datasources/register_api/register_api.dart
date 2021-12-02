import 'package:arretadas/app/modules/register/domain/erros/erros.dart';
import 'package:arretadas/app/modules/register/domain/usecases/register_usecase.dart';
import 'package:arretadas/app/modules/register/infra/datasources/register_datasource.dart';
import 'package:dio/dio.dart';

class RegisterApi implements RegisterDatasource {
  final Dio dio;

  RegisterApi(this.dio);

  Future<void> cadastrar(RegisterParams params) async {
    try {
      final response = await this
          .dio
          .post('https://arretadas-api.herokuapp.com/user', data: {
        'nickname': params.nickname,
        'password': params.password,
        'city': params.city,
        'protection_code': params.protectionCode,
        'aleatory_questions': params.aleatoryQuestions,
        'roles': params.roles
      });
      print(response.data);
    } on DioError catch (e) {
      throw RegisterException(e.message);
    }
  }
}
