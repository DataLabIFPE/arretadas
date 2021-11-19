import 'dart:convert';

import 'package:arretadas/app/modules/friendcontacts/domain/entities/friendcontact.dart';
import 'package:arretadas/app/modules/friendcontacts/domain/errors/erros.dart';
import 'package:arretadas/app/modules/friendcontacts/infra/datasources/friendcontact_datasource.dart';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    try {
      final response = await dio
          .get('https://arretadas-api.herokuapp.com/friendcontact/user/$id');
      print(response.data);
      return response.data
          .map<Friendcontact>((m) => Friendcontact.fromMap(m))
          .toList();
    } on DioError catch (e) {
      throw Failure(e.message);
    }
  }
}
