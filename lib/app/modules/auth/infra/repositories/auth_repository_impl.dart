import 'package:arretadas/app/modules/auth/domain/entities/user.dart';
import 'package:arretadas/app/modules/auth/domain/erros/erros.dart';
import 'package:arretadas/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:arretadas/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:arretadas/app/modules/auth/infra/datasources/auth_datasource.dart';

import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<Either<AuthException, User>> login(CredentialsParams params) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final user = await datasource.login(params);
      sp.setString('user', user.toJson());
      return Right(user);
    } on AuthException catch (e) {
      return Left(e);
    }
  }
}
