import 'package:arretadas/app/modules/recoveryQuestions/domain/entities/user.dart';

import '../../domain/usecases/recovery_usecase.dart';

abstract class RecoveryQuestionsDatasource {
  Future<User> verify(RecoveryQuestionsParams params);
}
