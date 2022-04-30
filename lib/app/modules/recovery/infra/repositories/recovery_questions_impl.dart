import 'package:arretadas/app/modules/recovery/domain/entities/user.dart';
import 'package:arretadas/app/modules/recovery/domain/erros/erros.dart';
import 'package:arretadas/app/modules/recovery/domain/repositories/recovery_questions_repository.dart';
import 'package:arretadas/app/modules/recovery/domain/usecases/recovery_questions_usecase.dart';
import 'package:fpdart/fpdart.dart';

import '../datasources/recovery_questions_datasource.dart';

class RecoveryQuestionsImpl implements RecoveryQuestionsRepository {
  final RecoveryQuestionsDatasource datasource;

  RecoveryQuestionsImpl(this.datasource);

  @override
  Future<Either<RecoveryQuestionsException, User>> verify(
      RecoveryQuestionsParams params) async {
    try {
      final user = await datasource.verify(params);
      return Right(user);
    } on RecoveryQuestionsException catch (e) {
      return Left(e);
    }
  }
}
