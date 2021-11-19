import 'dart:convert';

import 'package:arretadas/app/modules/complaints/domain/entities/complaint.dart';
import 'package:arretadas/app/modules/complaints/domain/erros/erros.dart';
import 'package:arretadas/app/modules/complaints/domain/usecases/complaint_usecase.dart';
import 'package:arretadas/app/modules/complaints/infra/datasources/complaint_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ComplaintsApi implements ComplaintDatasource {
  final Dio dio;

  ComplaintsApi(this.dio);

  @override
  Future<Complaint> sendComplaint(ComplaintParams params) async {
    var shared = await Modular.getAsync<SharedPreferences>();
    var user = (shared.getString('user') ?? "");
    var userMap = json.decode(user);
    var token = userMap['token'];
    var tokenBearer = 'Bearer ' + token;
    dio.options.headers['authorization'] = tokenBearer;

    try {
      final response = await dio
          .post('https://arretadas-api.herokuapp.com/complaint', data: {
        'latitude': params.local!.latitude,
        'longitude': params.local!.longitude,
        'date': params.data,
        'hour': params.hora,
        'type_complaint': params.tipoViolencia,
      });
      return Complaint(hora: response.statusMessage.toString());
    } on DioError catch (e) {
      throw ComplaintException(e.message);
    }
  }
}
