import 'package:arretadas/app/core/adapter.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/erros/erros.dart';
import '../../domain/usecases/change_password_usecase.dart';

class ChangePasswordStore
    extends NotifierStore<ChangePasswordException, String> {
  final IChangePasswordUsecase changeUsecase;

  ChangePasswordStore(this.changeUsecase) : super('');

  void change(ChangePasswordParams params) {
    executeEither(() => EitherAdapterImpl.adapter(changeUsecase(params)));
  }
}
