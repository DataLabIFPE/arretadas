import 'package:arretadas/exceptions/rest_exception.dart';
import 'package:arretadas/helpers/custom_dio.dart';

import 'package:arretadas/models/friendcontact_model.dart';
import 'package:dio/dio.dart';

class FriendContactRepository {
  Future<List<FriendContactModel>> findAll() async {
    var dio = CustomDio().instance;
    try {
      final response =
          await dio.get('https://arretadas-api.herokuapp.com/friendcontact/');
      return response.data
          .map<FriendContactModel>((m) => FriendContactModel.fromMap(m))
          .toList();
    } on DioError catch (e) {
      print('Erro na requisição');
      print(e);
      throw RestException('Erro ao buscar Amigos');
    }
  }

  Future<List<FriendContactModel>> findByName() async {
    var dio = CustomDio().instance;
    try {
      final response =
          await dio.get('https://arretadas-api.herokuapp.com/friendcontact');
      return response.data
          .map<FriendContactModel>((m) => FriendContactModel.fromMap(m))
          .toList();
    } on DioError catch (e) {
      print('Erro na requisição');
      print(e);
      throw RestException('Erro ao buscar Amigos');
    }
  }
}
