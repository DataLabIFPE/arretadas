import 'package:arretadas/app/core/constants/api_endpoint.dart';
import 'package:arretadas/app/modules/change_password/domain/erros/erros.dart';
import 'package:arretadas/app/modules/change_password/domain/usecases/change_password_usecase.dart';
import 'package:arretadas/app/modules/change_password/infra/datasources/change_password_datasource.dart';
import 'package:dio/dio.dart';

class ChangePasswordApi implements ChangePasswordDatasource {
  final Dio dio;

  ChangePasswordApi(this.dio);

  @override
  Future<String> change(ChangePasswordParams params) async {
    dio.options.connectTimeout = 10000;
    dio.options.headers['authorization'] = 'Bearer ${params.token}';
    try {
      final response = await dio
          .put('${ApiEndpoint.urlProducao}/user/update-password', data: {
        'id': params.id,
        'nickname': params.nickname,
        'newPassword': params.newPassword,
        'oldPassword': params.oldPassword,
      });
      String? resposta = response.statusMessage;
      return resposta!;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw ChangePasswordException(
            "Servidor FORA DO AR! Tente novamente mais tarde!");
      } else if (e.type == DioErrorType.other) {
        throw ChangePasswordException("Sem conexão com a Internet");
      } else {
        throw ChangePasswordException(e.response?.data['message']);
      }
    }
  }
}
