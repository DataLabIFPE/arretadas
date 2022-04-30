import 'package:arretadas/app/modules/recovery/domain/entities/user.dart';

import '../../domain/usecases/recovery_questions_usecase.dart';

abstract class RecoveryQuestionsDatasource {
  Future<User> verify(RecoveryQuestionsParams params);
}
