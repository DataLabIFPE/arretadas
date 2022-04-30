import 'package:arretadas/app/core/adapter.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/erros/erros.dart';
import '../../domain/usecases/recovery_password_usecase.dart';

class RecoveryPasswordStore
    extends NotifierStore<RecoveryPasswordException, String> {
  final IRecoveryPasswordUsecase recoveryUsecase;

  RecoveryPasswordStore(this.recoveryUsecase) : super('');

  void recovery(RecoveryPasswordParams params) {
    executeEither(() => EitherAdapterImpl.adapter(recoveryUsecase(params)));
  }
}
