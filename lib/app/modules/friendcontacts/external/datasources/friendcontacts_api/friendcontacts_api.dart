import 'dart:convert';

import 'package:arretadas/app/modules/friendcontacts/domain/entities/friendcontact.dart';
import 'package:arretadas/app/modules/friendcontacts/domain/errors/erros.dart';
import 'package:arretadas/app/modules/friendcontacts/infra/datasources/friendcontact_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constants/api_endpoint.dart';

class FriendcontactsApi implements FriendcontactDatasource {
  final Dio dio;

  FriendcontactsApi(this.dio);

  @override
  Future<List<Friendcontact>> getFriendcontacts(String id) async {
    var shared = await Modular.getAsync<SharedPreferences>();
    var user = (shared.getString('user') ?? "");
    var userMap = json.decode(user);
    var token = userMap['token'];
    var tokenBearer = 'Bearer ' + token;
    dio.options.headers['authorization'] = tokenBearer;
    dio.options.connectTimeout = 5000;
    try {
      final response =
          await dio.get('${ApiEndpoint.urlHeroku}/friendcontact/user/$id');
      print(response.data);
      return response.data
          .map<Friendcontact>((m) => Friendcontact.fromMap(m))
          .toList();
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw Failure("Servidor FORA DO AR! Tente novamente mais tarde!");
      } else if (e.type == DioErrorType.other) {
        throw Failure("Sem conexão com a Internet");
      } else {
        throw Failure(e.message);
      }
    }
  }
}
