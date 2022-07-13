import 'dart:convert';

import 'package:arretadas/app/modules/complaints/domain/erros/erros.dart';
import 'package:arretadas/app/modules/complaints/domain/usecases/complaint_usecase.dart';
import 'package:arretadas/app/modules/complaints/infra/datasources/complaint_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/api_endpoint.dart';

class ComplaintsApi implements ComplaintDatasource {
  final Dio dio;

  ComplaintsApi(this.dio);

  @override
  Future<String> sendComplaint(ComplaintParams params) async {
    var shared = await Modular.getAsync<SharedPreferences>();
    var user = (shared.getString('user') ?? "");
    var userMap = json.decode(user);
    var token = userMap['token'];
    var tokenBearer = 'Bearer ' + token;
    dio.options.headers['authorization'] = tokenBearer;
    dio.options.connectTimeout = 5000;

    try {
      final response =
          await dio.post('${ApiEndpoint.urlHeroku}/complaint', data: {
        'latitude': params.local!.latitude,
        'longitude': params.local!.longitude,
        'date': params.data,
        'hour': params.hora,
        'type_complaint': params.tipoViolencia,
      });
      return response.data["message"];
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw ComplaintException(
            "Servidor FORA DO AR! Tente novamente mais tarde!");
      } else if (e.type == DioErrorType.other) {
        throw ComplaintException("Sem conexão com a Internet");
      } else {
        throw ComplaintException(e.message);
      }
    }
  }
}
