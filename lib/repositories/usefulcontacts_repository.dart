import 'package:arretadas/helpers/custom_dio.dart';
import 'package:arretadas/exceptions/rest_exception.dart';

import 'package:arretadas/models/usefulcontact_model.dart';
import 'package:dio/dio.dart';

class UsefulcontactsRepository {
  Future<List<UsefulcontactModel>> findAll() async {
    var dio = CustomDio().instance;

    try {
      final response =
          await dio.get('https://arretadas-api.herokuapp.com/usefulcontacts');
      return response.data
          .map<UsefulcontactModel>((m) => UsefulcontactModel.fromMap(m))
          .toList();
      // return response.data.map<UsefulcontactModel>().toList();
    } on DioError catch (e) {
      print('Erro na requisição');
      print(e);
      throw RestException('Erro ao buscar Contatos');
    }
  }
}
