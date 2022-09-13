import 'package:fpdart/fpdart.dart';

import '../errors/errors.dart';
import '../repositories/delete_account_repository.dart';

abstract class IDeleteAccountUsecase {
  Future<Either<DeleteAccountException, String>> call(
      DeleteAccountParams params);
}

class DeleteAccountUsecase implements IDeleteAccountUsecase {
  final DeleteAccountRepository repository;

  DeleteAccountUsecase(this.repository);

  @override
  Future<Either<DeleteAccountException, String>> call(
      DeleteAccountParams params) async {
    if (params.id.isEmpty) {
      return Left(DeleteAccountException('Usuário inválido'));
    }
    return await repository.deleteAccount(params);
  }
}

class DeleteAccountParams {
  final String id;
  final String? token;

  DeleteAccountParams({
    required this.id,
    required this.token,
  });
}
