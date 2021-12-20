import 'package:arretadas/app/modules/register/domain/erros/erros.dart';
import 'package:arretadas/app/modules/register/domain/repositories/register_repository.dart';
import 'package:arretadas/app/modules/register/infra/datasources/register_datasource.dart';

import 'package:arretadas/app/modules/register/domain/usecases/register_usecase.dart';
import 'package:fpdart/fpdart.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDatasource datasource;

  RegisterRepositoryImpl(this.datasource);

  @override
  Future<Either<RegisterException, bool>> cadastrar(
      RegisterParams params) async {
    try {
      await datasource.cadastrar(params);
      return Right(true);
    } on RegisterException catch (e) {
      return Left(e);
    }
  }
}
