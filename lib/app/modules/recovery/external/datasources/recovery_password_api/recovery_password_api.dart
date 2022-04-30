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
    try {
      final response = await this
          .dio
          .patch('${ApiEndpoint.url_heroku}/user/recover-password', data: {
        'id': params.id,
        'newPassword': params.newPassword,
      });
      String? resposta = response.statusMessage;
      return resposta!;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw RecoveryPasswordException("Sem conexão com a Internet");
      } else if (e.type == DioErrorType.other) {
        throw RecoveryPasswordException("Sem conexão com a Internet");
      } else {
        throw RecoveryPasswordException(e.message);
      }
    }
  }
}
