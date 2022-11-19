import 'package:arretadas/app/core/constants/api_endpoint.dart';
import 'package:dio/dio.dart';

import '../../../domain/errors/errors.dart';
import '../../../domain/usecases/delete_account_usecase.dart';
import '../../../infra/datasources/delete_account_datasource.dart';

class UserApi implements DeleteAccountDatasource {
  final Dio dio;

  UserApi(this.dio);

  @override
  Future<String> deleteAccount(DeleteAccountParams params) async {
    dio.options.connectTimeout = 10000;
    dio.options.headers['authorization'] = 'Bearer ${params.token}';
    try {
      await dio.delete('${ApiEndpoint.urlProducao}/user', data: {
        'id': params.id,
      });
      return "Usuário removido com sucesso!";
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw DeleteAccountException(
            "Servidor FORA DO AR! Tente novamente mais tarde!");
      } else if (e.type == DioErrorType.other) {
        throw DeleteAccountException("Sem conexão com a Internet");
      } else {
        throw DeleteAccountException(e.message);
      }
    }
  }
}
