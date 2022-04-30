import 'package:arretadas/app/modules/recovery/domain/entities/user.dart';
import 'package:arretadas/app/modules/recovery/domain/erros/erros.dart';
import 'package:arretadas/app/modules/recovery/domain/repositories/recovery_questions_repository.dart';
import 'package:fpdart/fpdart.dart';

abstract class IRecoveryQuestionsUsecase {
  Future<Either<RecoveryQuestionsException, User>> call(
      RecoveryQuestionsParams params);
}

class RecoveryQuestionsUsecase implements IRecoveryQuestionsUsecase {
  final RecoveryQuestionsRepository repository;

  RecoveryQuestionsUsecase(this.repository);

  @override
  Future<Either<RecoveryQuestionsException, User>> call(
      RecoveryQuestionsParams params) async {
    if (params.nickname.length < 3) {
      return Left(RecoveryQuestionsException('Nickname inválido'));
    }
    if (params.indexQuestion == 0) {
      return Left(
          RecoveryQuestionsException('Informe a pergunta de segurança'));
    }
    if (params.answerQuestion.length < 3) {
      return Left(RecoveryQuestionsException('Resposta inválida'));
    }
    return await repository.verify(params);
  }
}

class RecoveryQuestionsParams {
  final String nickname;
  final int indexQuestion;
  final String answerQuestion;

  RecoveryQuestionsParams(
      {required this.nickname,
      required this.indexQuestion,
      required this.answerQuestion});
}
