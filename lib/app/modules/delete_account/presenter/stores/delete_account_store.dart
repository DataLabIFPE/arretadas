import 'package:arretadas/app/core/adapter.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/errors/errors.dart';
import '../../domain/usecases/delete_account_usecase.dart';

class DeleteAccountStore extends NotifierStore<DeleteAccountException, String> {
  final IDeleteAccountUsecase deleteAccountUsecase;

  DeleteAccountStore(this.deleteAccountUsecase) : super('');

  void deleteAccount(DeleteAccountParams params) {
    executeEither(
        () => EitherAdapterImpl.adapter(deleteAccountUsecase(params)));
  }
}
