import 'package:arretadas/app/core/constants/api_endpoint.dart';
import 'package:arretadas/app/modules/recovery/domain/erros/erros.dart';
import 'package:arretadas/app/modules/recovery/domain/usecases/recovery_password_usecase.dart';
import 'package:arretadas/app/modules/recovery/infra/datasources/recovery_password_datasource.dart';
import 'package:dio/dio.dart';

class RecoveryPasswordApi implements RecoveryPasswordDatasource {
  final Dio dio;

  RecoveryPasswordApi(this.dio);

  @override
  Future<String> recover(RecoveryPasswordParams params) async {
    dio.options.connectTimeout = 10000;
    try {
      final response = await dio
          .patch('${ApiEndpoint.urlProducao}/user/recover-password', data: {
        'id': params.id,
        'newPassword': params.newPassword,
      });
      String? resposta = response.statusMessage;
      return resposta!;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw RecoveryPasswordException(
            "Servidor FORA DO AR! Tente novamente mais tarde!");
      } else if (e.type == DioErrorType.other) {
        throw RecoveryPasswordException("Sem conexão com a Internet");
      } else {
        throw RecoveryPasswordException(e.message);
      }
    }
  }
}
