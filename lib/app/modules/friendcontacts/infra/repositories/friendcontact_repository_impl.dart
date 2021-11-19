import 'dart:convert';

import 'package:arretadas/app/modules/friendcontacts/domain/entities/friendcontact.dart';
import 'package:arretadas/app/modules/friendcontacts/domain/errors/erros.dart';
import 'package:arretadas/app/modules/friendcontacts/domain/repositories/friendcontact_repository.dart';
import 'package:arretadas/app/modules/friendcontacts/infra/datasources/friendcontact_datasource.dart';

import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FriendcontactRepositoryImpl implements FriendcontactRepository {
  final FriendcontactDatasource datasource;

  FriendcontactRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Friendcontact>>> getFriendcontacts() async {
    try {
      final sp = await SharedPreferences.getInstance();
      var valor = sp.getString("user");
      var valorMap = json.decode(valor!);
      var id = valorMap['id'].toString();
      final friendcontacts = await datasource.getFriendcontacts(id);

      return Right(friendcontacts);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
