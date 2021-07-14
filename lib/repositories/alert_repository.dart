import 'package:arretadas/exceptions/rest_exception.dart';
import 'package:arretadas/helpers/custom_dio.dart';

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class AlertRepository {
  Future<dynamic> sendMessage(Position data) async {
    var dio = CustomDio().instance;

    try {
      await dio.post('https://arretadas-api.herokuapp.com/alert',
          data: {'latitude': data.latitude, 'longitude': data.longitude});
    } on DioError catch (e) {
      print('Erro na requisição');
      print(e);
      throw RestException('Erro ao enviar alerta');
    }
  }
}
