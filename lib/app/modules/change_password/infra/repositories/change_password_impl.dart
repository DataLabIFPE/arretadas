import 'package:fpdart/fpdart.dart';

import '../../domain/erros/erros.dart';
import '../../domain/repositories/change_password_repository.dart';
import '../../domain/usecases/change_password_usecase.dart';
import '../datasources/change_password_datasource.dart';

class ChangePasswordImpl implements ChangePasswordRepository {
  final ChangePasswordDatasource datasource;

  ChangePasswordImpl(this.datasource);

  @override
  Future<Either<ChangePasswordException, String>> change(
      ChangePasswordParams params) async {
    try {
      final response = await datasource.change(params);
      return Right(response);
    } on ChangePasswordException catch (e) {
      return Left(e);
    }
  }
}
