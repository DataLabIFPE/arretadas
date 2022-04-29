import 'package:arretadas/app/modules/recoveryQuestions/domain/entities/user.dart';
import 'package:arretadas/app/modules/recoveryQuestions/domain/erros/erros.dart';
import 'package:arretadas/app/modules/recoveryQuestions/domain/usecases/recovery_usecase.dart';
import 'package:fpdart/fpdart.dart';

abstract class RecoveryQuestionsRepository {
  Future<Either<RecoveryQuestionsException, User>> verify(
      RecoveryQuestionsParams params);
}
