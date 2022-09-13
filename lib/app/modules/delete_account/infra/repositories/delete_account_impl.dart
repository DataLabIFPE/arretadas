import 'package:fpdart/fpdart.dart';

import '../../domain/errors/errors.dart';
import '../../domain/repositories/delete_account_repository.dart';
import '../../domain/usecases/delete_account_usecase.dart';
import '../datasources/delete_account_datasource.dart';

class DeleteAccountRepositoryImpl implements DeleteAccountRepository {
  final DeleteAccountDatasource datasource;

  DeleteAccountRepositoryImpl(this.datasource);

  @override
  Future<Either<DeleteAccountException, String>> deleteAccount(
      DeleteAccountParams params) async {
    try {
      final response = await datasource.deleteAccount(params);
      return Right(response);
    } on DeleteAccountException catch (e) {
      return Left(e);
    }
  }
}
