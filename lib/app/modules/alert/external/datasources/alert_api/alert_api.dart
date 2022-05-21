import 'package:arretadas/app/core/constants/api_endpoint.dart';
import 'package:arretadas/app/modules/alert/domain/errors/errors.dart';
import 'package:arretadas/app/modules/alert/domain/usecases/alert_usecase.dart';
import 'package:arretadas/app/modules/alert/infra/datasources/alert_datasource.dart';
import 'package:dio/dio.dart';

class AlertApi implements AlertDatasource {
  final Dio dio;

  AlertApi(this.dio);

  @override
  Future<String> sendAlert(AlertParams params) async {
    dio.options.headers['authorization'] = 'Bearer ${params.token}';
    try {
      final response = await dio.post('${ApiEndpoint.urlHeroku}/alert', data: {
        'id': params.userId,
        'latitude': params.latitude,
        'longitude': params.longitude,
        'date': params.date,
        'hour': params.hour,
      });
      return response.data['message'];
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw AlertException("Sem conexão com a Internet");
      } else if (e.type == DioErrorType.other) {
        throw AlertException("Sem conexão com a Internet");
      } else {
        throw AlertException(e.message);
      }
    }
  }
}
