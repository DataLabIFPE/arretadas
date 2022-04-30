import 'dart:convert';

import 'package:arretadas/app/modules/friendcontacts/domain/entities/friendcontact.dart';
import 'package:arretadas/app/modules/friendcontacts/domain/errors/erros.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constants/api_endpoint.dart';

class FriendContactRepository {
  Future<void> removeContact(String id) async {
    var dio = Dio();
    var shared = await Modular.getAsync<SharedPreferences>();
    var user = (shared.getString('user') ?? "");
    var userMap = json.decode(user);
    var token = userMap['token'];
    var tokenBearer = 'Bearer ' + token;
    dio.options.headers['authorization'] = tokenBearer;

    try {
      await dio.delete("${ApiEndpoint.url_heroku}/friendcontact/id/$id");
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

  Future<dynamic> addContact(Friendcontact friendcontact) async {
    var dio = Dio();
    var shared = await Modular.getAsync<SharedPreferences>();
    var user = (shared.getString('user') ?? "");
    var userMap = json.decode(user);
    var id = userMap['id'];
    var token = userMap['token'];
    var tokenBearer = 'Bearer ' + token;
    dio.options.headers['authorization'] = tokenBearer;
    try {
      await dio.post("${ApiEndpoint.url_heroku}/friendcontact", data: {
        "id": id,
        "name": friendcontact.name,
        "number": friendcontact.number,
      });
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

  Future<void> updateContact(Friendcontact friendcontact) async {
    print('editado');
    print(friendcontact.id);
    print(friendcontact.name);
    print(friendcontact.number);
    var dio = Dio();
    var shared = await Modular.getAsync<SharedPreferences>();
    var user = (shared.getString('user') ?? "");
    var userMap = json.decode(user);
    var token = userMap['token'];
    var tokenBearer = 'Bearer ' + token;
    dio.options.headers['authorization'] = tokenBearer;
    dio.options.headers['x-access-token'] = token;
    try {
      var response = await dio.put(
          "${ApiEndpoint.url_heroku}/friendcontact/${friendcontact.id}",
          data: {
            "name": friendcontact.name,
            "number": friendcontact.number,
          });

      print(response);
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
