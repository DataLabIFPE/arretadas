import 'package:arretadas/app/modules/recovery/domain/entities/user.dart';
import 'package:arretadas/app/modules/recovery/domain/erros/erros.dart';
import 'package:arretadas/app/modules/recovery/domain/usecases/recovery_questions_usecase.dart';
import 'package:fpdart/fpdart.dart';

abstract class RecoveryQuestionsRepository {
  Future<Either<RecoveryQuestionsException, User>> verify(
      RecoveryQuestionsParams params);
}
