import 'package:dio/dio.dart';

import '../../../../../core/constants/api_endpoint.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/erros/erros.dart';
import '../../../domain/usecases/recovery_questions_usecase.dart';
import '../../../infra/datasources/recovery_questions_datasource.dart';
import 'mapper.dart';

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
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw RecoveryQuestionsException("Sem conexão com a Internet");
      } else if (e.type == DioErrorType.other) {
        throw RecoveryQuestionsException("Sem conexão com a Internet");
      } else {
        throw RecoveryQuestionsException(e.message);
      }
    }
  }
}
