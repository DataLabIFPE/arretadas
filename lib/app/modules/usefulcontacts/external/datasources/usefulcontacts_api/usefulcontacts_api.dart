import 'dart:convert';

import 'package:arretadas/app/modules/usefulcontacts/domain/entities/usefulcontact.dart';
import 'package:arretadas/app/modules/usefulcontacts/domain/errors/erros.dart';
import 'package:arretadas/app/modules/usefulcontacts/infra/datasources/usefulcontact_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constants/api_endpoint.dart';

class UsefulcontactsApi implements UsefulcontactDatasource {
  final Dio dio;

  UsefulcontactsApi(this.dio);

  @override
  Future<List<Usefulcontact>> getUsefulcontacts() async {
    var shared = await Modular.getAsync<SharedPreferences>();
    var user = (shared.getString('user') ?? "");
    var userMap = json.decode(user);
    var token = userMap['token'];
    var tokenBearer = 'Bearer ' + token;
    dio.options.headers['authorization'] = tokenBearer;

    try {
      final response =
          await dio.get('${ApiEndpoint.url_heroku}/usefulcontacts');

      return response.data
          .map<Usefulcontact>((e) => Usefulcontact.fromMap(e))
          .toList();
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw Failure("Sem conexão com a Internet");
      } else if (e.type == DioErrorType.other) {
        throw Failure("Sem conexão com a Internet");
      } else {
        throw Failure(e.message);
      }
    }
  }
}
