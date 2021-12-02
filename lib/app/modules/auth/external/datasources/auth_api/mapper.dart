import 'package:arretadas/app/modules/auth/domain/entities/user.dart';

class UserMapper {
  static User fromJson(Map<String, dynamic> json) {
    return User(
        id: json['data']['id'],
        nickname: json['data']['nickname'],
        city: json['data']['city'],
        token: json['token']
        //protectionCode: json['data']['protection_code'],
        );
  }
}
