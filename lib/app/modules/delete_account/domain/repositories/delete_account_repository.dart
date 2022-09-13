import 'package:fpdart/fpdart.dart';

import '../errors/errors.dart';
import '../usecases/delete_account_usecase.dart';

abstract class DeleteAccountRepository {
  Future<Either<DeleteAccountException, String>> deleteAccount(
      DeleteAccountParams params);
}
