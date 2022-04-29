import 'package:arretadas/app/modules/recoveryQuestions/domain/entities/user.dart';
import 'package:arretadas/app/modules/recoveryQuestions/domain/erros/erros.dart';
import 'package:arretadas/app/modules/recoveryQuestions/domain/usecases/recovery_usecase.dart';
import 'package:arretadas/app/modules/recoveryQuestions/external/datasources/recovery_questions_api/mapper.dart';
import 'package:arretadas/app/modules/recoveryQuestions/infra/datasources/recovery_questions_datasource.dart';
import 'package:dio/dio.dart';

import '../../../../../core/constants/api_endpoint.dart';

class RecoveryQuestionsApi implements RecoveryQuestionsDatasource {
  final Dio dio;

  RecoveryQuestionsApi(this.dio);

  @override
  Future<User> verify(RecoveryQuestionsParams params) async {
    try {
      final response = await this
          .dio
          .post('${ApiEndpoint.url_heroku}/user/recover-questions', data: {
        'nickname': params.nickname,
        'indexQuestion': params.indexQuestion,
        'answerQuestion': params.answerQuestion,
      });
      return UserMapper.fromJson(response.data);
    } on DioError catch (e) {
      throw RecoveryQuestionsException(e.message);
    }
  }
}
