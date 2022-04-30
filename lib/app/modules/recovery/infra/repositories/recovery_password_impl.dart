import 'package:fpdart/fpdart.dart';

import '../../domain/erros/erros.dart';
import '../../domain/repositories/recovery_password_repository.dart';
import '../../domain/usecases/recovery_password_usecase.dart';
import '../datasources/recovery_password_datasource.dart';

class RecoveryPasswordImpl implements RecoveryPasswordRepository {
  final RecoveryPasswordDatasource datasource;

  RecoveryPasswordImpl(this.datasource);

  @override
  Future<Either<RecoveryPasswordException, String>> recover(
      RecoveryPasswordParams params) async {
    try {
      final response = await datasource.recover(params);
      return Right(response);
    } on RecoveryPasswordException catch (e) {
      return Left(e);
    }
  }
}
