import 'package:arretadas/app/modules/auth/domain/entities/user.dart';
import 'package:arretadas/app/modules/auth/external/datasources/auth_api/mapper.dart';
import 'package:dio/dio.dart';

import '../../core/constants/api_endpoint.dart';

class SplashRepository {
  final Dio dio;

  SplashRepository(this.dio);

  Future<User> refreshToken(User user) async {
    try {
      final response =
          await dio.post("${ApiEndpoint.urlHeroku}/user/refresh-token", data: {
        'token': user.token,
        'id': user.id,
        'nickname': user.nickname,
      });
      return UserMapper.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      return User();
    }
  }
}
