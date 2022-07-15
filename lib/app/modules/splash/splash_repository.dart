import 'package:arretadas/app/modules/auth/domain/entities/user.dart';
import 'package:arretadas/app/modules/auth/external/datasources/auth_api/mapper.dart';
import 'package:arretadas/app/modules/splash/splash_exception.dart';
import 'package:dio/dio.dart';

import '../../core/constants/api_endpoint.dart';

class SplashRepository {
  final Dio dio;

  SplashRepository(this.dio);

  Future<User> refreshToken(User user) async {
    dio.options.connectTimeout = 5000;
    try {
      final response =
          await dio.post("${ApiEndpoint.urlHeroku}/user/refresh-token", data: {
        'token': user.token,
        'id': user.id,
        'nickname': user.nickname,
      });
      return UserMapper.fromJson(response.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw SplashException(
            "Servidor FORA DO AR! Tente novamente mais tarde!");
      } else if (e.type == DioErrorType.other) {
        throw SplashException("Sem conexão com a Internet");
      } else {
        throw SplashException(e.message);
      }
    }
  }
}
