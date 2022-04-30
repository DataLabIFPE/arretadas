import 'package:arretadas/app/modules/recovery/domain/entities/user.dart';

class UserMapper {
  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      nickname: json['nickname'],
    );
  }
}
