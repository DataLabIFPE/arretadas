import 'package:arretadas/app/core/adapter.dart';
import 'package:arretadas/app/modules/recoveryQuestions/domain/entities/user.dart';
import 'package:arretadas/app/modules/recoveryQuestions/domain/erros/erros.dart';
import 'package:arretadas/app/modules/recoveryQuestions/domain/usecases/recovery_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class RecoveryQuestionsStore
    extends NotifierStore<RecoveryQuestionsException, User> {
  final IRecoveryUsecase recoveryUsecase;

  RecoveryQuestionsStore(this.recoveryUsecase) : super(User.empty());

  void recovery(RecoveryQuestionsParams params) {
    executeEither(() => EitherAdapterImpl.adapter(recoveryUsecase(params)));
  }
}
