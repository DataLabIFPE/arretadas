import 'package:arretadas/exceptions/rest_exception.dart';
import 'package:arretadas/helpers/custom_dio.dart';

import 'package:arretadas/models/friendcontact_model.dart';
import 'package:dio/dio.dart';

class FriendContactRepository {
  Future<List<FriendContactModel>> findAllById(String id) async {
    var dio = CustomDio().instance;
    try {
      final response = await dio
          .get('https://arretadas-api.herokuapp.com/friendcontact/user/$id');
      return response.data
          .map<FriendContactModel>((m) => FriendContactModel.fromMap(m))
          .toList();
    } on DioError catch (e) {
      print('Erro na requisição');
      print(e);
      throw RestException('Erro ao buscar Amigos');
    }
  }

  Future<void> removeContact(String id) async {
    var dio = CustomDio().instance;
    try {
      await dio.delete("https://arretadas-api.herokuapp.com/friendcontact");
    } on DioError catch (e) {
      print(e.message);
      throw RestException('Erro ao remover contato');
    }
  }

  Future<void> addContact(FriendContactModel friendcontact) async {
    var dio = CustomDio().instance;
    try {
      await dio
          .post("https://arretadas-api.herokuapp.com/friendcontact", data: {
        "name": friendcontact.name,
        "number": friendcontact.number,
      });
    } on DioError catch (e) {
      print(e.message);
      throw RestException('Erro ao adicionar contato');
    }
  }

  Future<void> updateContact(FriendContactModel friendcontact) async {
    var dio = CustomDio().instance;
    try {
      await dio.put(
          "https://arretadas-api.herokuapp.com/friendcontact/${friendcontact.id}",
          data: {
            "name": friendcontact.name,
            "number": friendcontact.number,
          });
    } on DioError catch (e) {
      print(e.message);
      throw RestException('Erro ao atualizar o contato');
    }
  }
}
