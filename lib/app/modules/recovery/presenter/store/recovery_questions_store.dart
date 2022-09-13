import 'package:arretadas/app/core/adapter.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/entities/user.dart';
import '../../domain/erros/erros.dart';
import '../../domain/usecases/recovery_questions_usecase.dart';

class RecoveryQuestionsStore
    extends NotifierStore<RecoveryQuestionsException, User> {
  final IRecoveryQuestionsUsecase usecase;

  RecoveryQuestionsStore(this.usecase) : super(User.empty());

  void recovery(RecoveryQuestionsParams params) {
    executeEither(() => EitherAdapterImpl.adapter(usecase(params)));
  }
}
